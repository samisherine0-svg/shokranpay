import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ReportsCubit/ReportsCubit.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/PrintBody.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../Screens/Reports/CreditMovementsReport/CreditMovmentReportDetails.dart';

class CreditMovementsReportsTile extends StatefulWidget {
  Data data;

  CreditMovementsReportsTile(this.data);

  @override
  _CreditMovementsReportsTile createState() =>
      _CreditMovementsReportsTile(data);
}

class _CreditMovementsReportsTile extends State<CreditMovementsReportsTile> {
  Data data;

  _CreditMovementsReportsTile(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      "اسم الخدمة",
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      "${data.printServiceDetailes![0].value}",
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.date,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      "${data.time!} ${data.date!}",
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.balanceBefore,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.netBefore.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.amount,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.amount.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.commission,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.commission.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                children: [
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.balanceAfter,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.netAfter.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: RoundedButton(
                Translations.of(context)!.details,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CreditMovementsReportDetails(data,"","")));

                  //   _getDetails();
                  // _showDetails(report.resellerCreditId.toString());
                },
                GeneralColor.appColor,
                GeneralColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _getDetails() {
  //   PrintBody body = PrintBody(transactionNumber: data.transactionId!);
  //   Progress.show(context);
  //   BlocProvider.of<ReportsCubit>(context).printReport(context, "V1", body);
  // }
}
