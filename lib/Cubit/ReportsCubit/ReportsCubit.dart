import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Model/Body/ReportsBody/BillsReportsBody.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/CreditMovementsReportBody.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/PrintBody.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/BillsReportsResponse.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/PrintResponse.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/PendingBillsResponse.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReportsResult.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovmentReportDetails.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReportResult.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Repositry/ReportsRepositry.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart'
    as CreditResponse;
import '../../Model/Body/ReportsBody/DailyCreditBody.dart';
import '../../Model/Body/ReportsBody/DetailedReportBody.dart';
import '../../Model/Response/ReportsResponse/DailyCredit/DailyCreditResponse.dart';
import '../../Model/Response/ReportsResponse/DetailedReportResponse.dart';
import '../../Ui/Screens/Reports/DetailedReport/DetailedReportResult.dart';

part 'ReportsState.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(InitialReportsState());

  static ReportsCubit get(context) => BlocProvider.of(context);

  getBillsReports(BuildContext context, String version,
      BillsReportsBody billsReportsBody) async {
    try {
      http.Response response =
          await getBillsReportsApi(version, billsReportsBody);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        BillsReportsResponse billsReportsResponse =
            BillsReportsResponse.fromJson(json.decode(response.body));
        if (billsReportsResponse.code == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BillsReportsResult(billsReportsResponse.data!)));
        } else {
          UtilsFunctions.createToast(billsReportsResponse.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(statusCode.toString());
      }
    } catch (e) {
      print("e" + e.toString());
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  getCreditMovementReports(BuildContext context, String version,
      CreditMovementsReportBody body) async {
    try {
      http.Response response = await getCreditMovementsReportApi(version, body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        CreditMovementsReportResponse creditMovementsReportResponse =
            CreditMovementsReportResponse.fromJson(json.decode(response.body));

        if (creditMovementsReportResponse.code == 200) {
          List<CreditResponse.Data> all = [];
          creditMovementsReportResponse.data!.forEach((element) {
            all.add(element);
          });

          all.sort((a, b) => b.transactionId!.compareTo(a.transactionId!));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreditMovementsReportResult(all)));
        } else {
          UtilsFunctions.createToast(creditMovementsReportResponse.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(statusCode.toString());
      }
    } catch (e) {
      print("e" + e.toString());
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  // printReport(BuildContext context, String version,
  //     PrintBody body) async {
  //   try {
  //     http.Response response =
  //     await printApi(version, body);
  //     int statusCode = response.statusCode;
  //     Progress.dismiss();
  //     if (statusCode == 200) {
  //       PrintResponse    printResponse =
  //       PrintResponse.fromJson(json.decode(response.body));
  //       if (printResponse.code == 200) {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => CreditMovementsReportDetails( printResponse.data!)));
  //       } else {
  //         UtilsFunctions.createToast(printResponse.message!);
  //       }
  //     } else if (statusCode == 401) {
  //       Common.logout();
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Login()));
  //     } else {
  //       UtilsFunctions.createToast(statusCode.toString());
  //     }
  //   } catch (e) {
  //     print("e" + e.toString());
  //     Progress.dismiss();
  //     UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
  //   }
  // }

  getPendingBills(BuildContext context) async {
    try {
      emit(PendingBillsLoadState());
      http.Response response = await getPendingBillsApi();
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        PendingBillsResponse pendingBillsResponse =
            PendingBillsResponse.fromJson(json.decode(response.body));
        emit(PendingBillsSuccessState(pendingBillsResponse));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        emit(PendingBillsErrorState(
            Translations.of(context)!.errorPleaseTryAgain));
      }
    } catch (ex) {
      emit(PendingBillsErrorState(ex.toString()));
    }
  }

  getDailyCredit(BuildContext context, DailyCreditBody body) async {
    try {
      emit(DailyCreditLoadState());
      http.Response response = await getDailyCreditApi(body);
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        DailyCreditResponse dailyCreditResponse =
            DailyCreditResponse.fromJson(json.decode(response.body));
        emit(DailyCreditSuccessState(dailyCreditResponse));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        emit(DailyCreditErrorState(
            Translations.of(context)!.errorPleaseTryAgain));
      }
    } catch (ex) {
      emit(DailyCreditErrorState(ex.toString()));
    }
  }

  getDetailedReport(
      BuildContext context, DetailedReportBody detailedReportBody) async {
    try {
      http.Response response = await getDetailedReportApi(detailedReportBody);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        DetailedReportResponse detailedReportResponse =
            DetailedReportResponse.fromJson(json.decode(response.body));
        if (detailedReportResponse.code == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailedReportResult(detailedReportResponse.data!)));
        } else {
          UtilsFunctions.createToast(detailedReportResponse.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(statusCode.toString());
      }
    } catch (e) {
      print("e" + e.toString());
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }
}
