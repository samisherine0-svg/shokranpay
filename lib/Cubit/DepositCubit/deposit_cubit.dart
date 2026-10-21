import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Model/Body/HomeBody/get_deposit_reportes_respone.dart';
import 'package:pioneerspay/Model/Body/HomeBody/get_deposits_body.dart';
import 'package:pioneerspay/Repositry/SellersRepositry.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/followDepositResult.dart';
import 'package:provider/provider.dart';
import '../../Model/Body/HomeBody/add_deposit_body.dart';
import '../../Model/Response/AuthorizationResponse/AttachmentsResponse.dart';
import '../../Model/Response/SellersResponse/CreateNewAgentUnderAgentResponse.dart';
import '../../Provider/ProviderAccount.dart';
import '../../Repositry/AuthorizationRepositry.dart';
import '../../Repositry/HomeRepositry.dart';
import '../../Repositry/ReportsRepositry.dart';
import '../../Ui/Screens/Authoriation/Login.dart';
import '../../Ui/Screens/Home/Home.dart';
import '../../Ui/Utils/Progress.dart';
import '../../Ui/Utils/UtilsFunctions.dart';
import '../../Utils/Common.dart';
import '../../Utils/Language/translation_strings.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());

  static DepositCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String dropDownBank = "";
  String dropDownBankId = "";
  List countryList = [];

  String dropDownDeposit = "";
  String dropDownDepositId = "";


  String dropDownStatus = "";
  String dropDownStatusId = "";
/////////////////////////////////////
  addAttachments(List<String> listImages, AddDepositBody addDepositBody,
      BuildContext context) async {
    try {
      var response = await addAttachmentsApi(listImages);
      String body = await response.stream.bytesToString();
      // print("res" + body.toString());

      AttachmentsResponse attachmentsResponse =
          AttachmentsResponse.fromJson(json.decode(body));
      if (attachmentsResponse.code == 200) {
        print(attachmentsResponse.data);
        addDepositBody.attachmentId = attachmentsResponse.data![0].toString();
        addDeposit(context, addDepositBody);
      } else {
        Progress.dismiss();
        UtilsFunctions.createToast(attachmentsResponse.message!);
      }
    } catch (e) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  addDeposit(BuildContext context, AddDepositBody body) async {
    try {
      http.Response response = await addDepositApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      print("Statsu $statusCode");
      if (statusCode == 200) {
        // CreateNewAgentUnderAgentResponse res =
        //     CreateNewAgentUnderAgentResponse.fromJson(
        //         json.decode(response.body));
        Map res=json.decode(response.body);
        if (res["Code"] == 200) {
          UtilsFunctions.createToast(res["Message"]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          UtilsFunctions.createToast(res["Message"]);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
      }
    } catch (ex) {

      Progress.dismiss();
      UtilsFunctions.createToast(ex.toString());
    }
  }

  validate(context) {
    String name = nameController.text;
    String amount = amountController.text;
    String orderNo = numberController.text;
    String notes = notesController.text.isEmpty ? "-" : notesController.text;
    if (name.isEmpty ||
        amount.isEmpty ||
        orderNo.isEmpty ||
        dropDownDepositId.isEmpty ||
        dropDownBankId.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      List<String>? list =
          Provider.of<ProviderAccount>(context, listen: false).getPhotos;

      AddDepositBody addDepositBody = AddDepositBody(
        clientName: name,
        bankId: dropDownBankId,
        creditType: dropDownDepositId,
        amount: amount,
        notes: notes,
        orderNo: orderNo,
      );
      if (list == null) {
        UtilsFunctions.createToast(Translations.of(context)!.selectFiles);
      } else {
        Progress.show(context);
        addAttachments(list, addDepositBody, context);
      }
    }
  }
/////////////////////////////////////////
  getDepositReports(BuildContext context,
      GetDepositBody body) async {
    Progress.show(context);
    try {
      http.Response response =
      await getDepositsReportApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        GetDepositResponse    getDepositResponse =
        GetDepositResponse.fromJson(json.decode(response.body));
        if (getDepositResponse.code == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FollowDepositResult(getDepositResponse)));
        } else {
          UtilsFunctions.createToast(getDepositResponse.message);
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
