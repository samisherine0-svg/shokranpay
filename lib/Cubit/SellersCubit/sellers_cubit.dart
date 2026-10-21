import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/Body/SellersBody/CreateNewAgentUnderAgentBody.dart';
import '../../Model/Response/AuthorizationResponse/AttachmentsResponse.dart';
import '../../Model/Response/SellersResponse/CreateNewAgentUnderAgentResponse.dart';
import '../../Repositry/AuthorizationRepositry.dart';
import '../../Repositry/SellersRepositry.dart';
import '../../Ui/Screens/Authoriation/Login.dart';
import '../../Ui/Screens/Home/Home.dart';
import '../../Ui/Utils/Progress.dart';
import '../../Ui/Utils/UtilsFunctions.dart';
import '../../Utils/Common.dart';
import '../../Utils/Language/translation_strings.dart';

part 'sellers_state.dart';

class SellersCubit extends Cubit<SellersState> {
  SellersCubit() : super(SellersInitial());

  createNewAgent(
      BuildContext context, CreateNewAgentUnderAgentBody body) async {
    print(body.Address);
    try {
      http.Response response = await createNewAgentApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();

      if (statusCode == 200) {
        CreateNewAgentUnderAgentResponse res =
            CreateNewAgentUnderAgentResponse.fromJson(
                json.decode(response.body));
        if (res.code == 200) {
          UtilsFunctions.createToast(res.message!);

          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => Home(),
            ),
            (route) => false,
          );
        } else {
          UtilsFunctions.createToast(res.message!);
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

  addAttachments(
      List<String> listImages,
      CreateNewAgentUnderAgentBody createNewAgentUnderAgentBody,
      BuildContext context) async {
    try {
      var response = await addAttachmentsApi(listImages);
      String body = await response.stream.bytesToString();
      print("res" + body.toString());

      AttachmentsResponse attachmentsResponse =
          AttachmentsResponse.fromJson(json.decode(body));
      if (attachmentsResponse.code == 200) {
        createNewAgentUnderAgentBody.attachmentsIds = attachmentsResponse.data!;
        createNewAgent(context, createNewAgentUnderAgentBody);
      } else {
        Progress.dismiss();
        UtilsFunctions.createToast(attachmentsResponse.message!);
      }
    } catch (e) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }
}
