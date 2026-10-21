import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Repositry/SettingsRepositry.dart';
import '../../Model/Body/SettingBody/ChangePasswordBody.dart';
import '../../Model/Response/SettingResponse/ChangePasswordResponse.dart';
import '../../Ui/Screens/Authoriation/Login.dart';
import '../../Ui/Utils/Progress.dart';
import '../../Ui/Utils/UtilsFunctions.dart';
import '../../Utils/Common.dart';
import '../../Utils/Language/translation_strings.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  changePass(BuildContext context, ChangePasswordBody body) async {
    try {
      http.Response response = await changePasswordsApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        ChangePasswordResponse res =
        ChangePasswordResponse.fromJson(json.decode(response.body));
        if (res.code == 200) {
          UtilsFunctions.createToast(res.message!);
          Common.logout();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
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

}
