import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Model/Body/SettingBody/ChangePasswordBody.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Screens/Settings/SettingsCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../Cubit/SettingsCubit/setting_cubit.dart';
import '../../Utils/Progress.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController retryNewPassController = TextEditingController();

  _ChangePassword();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.changePass,
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: GeneralColor.appColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: GeneralInputField(
                            text: Translations.of(context)!.oldPass,
                            controller: oldPassController,
                            textInputType: TextInputType.text, readOnly: false,),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: GeneralInputField(
                            text: Translations.of(context)!.newPass,
                            controller: newPassController,
                            textInputType: TextInputType.text, readOnly: false,),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: GeneralInputField(
                            text: Translations.of(context)!.retryPass,
                            controller: retryNewPassController,
                            textInputType: TextInputType.text, readOnly: false,),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: RoundedButton(
                          Translations.of(context)!.change,
                          () {
                            validate();
                          },
                          GeneralColor.appColor,
                          GeneralColor.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  validate(){
    String oldPass=oldPassController.text;
    String newPass=newPassController.text;
    String retryPass=retryNewPassController.text;
    if(oldPass.isEmpty||newPass.isEmpty||retryPass.isEmpty){
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    }else{
      ChangePasswordBody changePasswordBody=ChangePasswordBody(currentPassword: oldPass,password: newPass,confirmPassword: retryPass);
      Progress.show(context);
      BlocProvider.of<SettingCubit>(context).changePass(
          context,changePasswordBody);}
  }
}
