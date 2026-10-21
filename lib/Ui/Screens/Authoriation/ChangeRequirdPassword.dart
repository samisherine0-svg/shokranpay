import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/AuthorizationCubit/AuthCubit.dart';
import '../../../Cubit/SettingsCubit/setting_cubit.dart';
import '../../../Model/Body/AuthorizationBody/LoginBody.dart';
import '../../../Model/Body/SettingBody/ChangePasswordBody.dart';
import '../../../Utils/Colors/GeneralColor.dart';
import '../../../Utils/Language/translation_strings.dart';
import '../../Utils/GeneralInputField.dart';
import '../../Utils/Progress.dart';
import '../../Utils/RoundedButton.dart';
import '../../Utils/RoundedInputField.dart';
import '../../Utils/UtilsFunctions.dart';

class ChangeRequiredPassword extends StatefulWidget {
  final String password;

  const ChangeRequiredPassword({Key? key, required this.password})
      : super(key: key);

  @override
  _ChangeRequirdPassword createState() => _ChangeRequirdPassword();
}

class _ChangeRequirdPassword extends State<ChangeRequiredPassword> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController retryNewPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: GeneralColor.white,
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  // decoration: BoxDecoration(
                  //   border: Border.all(width: 2, color: GeneralColor.appColor),
                  //   borderRadius: BorderRadius.circular(15.0),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 25),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Center(
                            child: Image.asset(
                              "assets/images/app_logo.png",
                              height: 150,
                              width: 250,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                              text: Translations.of(context)!.newPass,
                              controller: newPassController,
                              textInputType: TextInputType.text),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                              text: Translations.of(context)!.retryPass,
                              controller: retryNewPassController,
                              textInputType: TextInputType.text),
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
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    String newPass = newPassController.text;
    String retryPass = retryNewPassController.text;
    if (newPass.isEmpty || retryPass.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      ChangePasswordBody changePasswordBody = ChangePasswordBody(
          currentPassword: widget.password,
          password: newPass,
          confirmPassword: retryPass);
      Progress.show(context);
      BlocProvider.of<SettingCubit>(context)
          .changePass(context, changePasswordBody);
    }
  }
}
