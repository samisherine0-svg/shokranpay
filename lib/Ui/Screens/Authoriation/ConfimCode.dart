
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/AuthorizationCubit/AuthCubit.dart';
import '../../../Model/Body/AuthorizationBody/LoginBody.dart';
import '../../../Utils/Colors/GeneralColor.dart';
import '../../../Utils/Language/translation_strings.dart';
import '../../Utils/Progress.dart';
import '../../Utils/RoundedButton.dart';
import '../../Utils/RoundedInputField.dart';
import '../../Utils/UtilsFunctions.dart';


class ConfirmCode extends StatefulWidget {
  final String name;
  final String password;
  final String deviceID;

  const ConfirmCode(
      {Key? key,
      required this.name,
      required this.password,
      required this.deviceID})
      : super(key: key);

  @override
  _ConfirmCode createState() => _ConfirmCode();
}

class _ConfirmCode extends State<ConfirmCode> {
  TextEditingController codeTextEditingController = TextEditingController();

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
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                          child: RoundedInputField(
                            icon: Icons.numbers,
                            hintText: Translations.of(context)!.enterCode,
                            onChanged: (value) {},
                            controller: codeTextEditingController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                              RoundedButton(Translations.of(context)!.send, () {
                            validateFields();
                          }, GeneralColor.appColor, GeneralColor.white),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RoundedButton(
                              Translations.of(context)!.resendCode, () {
                            resendCodeRequest();
                          }, GeneralColor.appColor, GeneralColor.white),
                        ),
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

  validateFields() async {
    String code = codeTextEditingController.text;
    if (code.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      LoginBody loginBody = LoginBody(
          userName: widget.name,
          password: widget.password,
          rememberMe: true,
          AppId: widget.deviceID,
          IsConfirmationProcess: "1",
          AppType: "2",
          OldSmsCode: code);
      Progress.show(context);
      BlocProvider.of<AuthCubit>(context).login(loginBody, context);
    }
  }

  resendCodeRequest() {
    Progress.show(context);
    LoginBody loginBody =
        LoginBody(userName: widget.name, AppId: widget.deviceID, AppType: "2");
    BlocProvider.of<AuthCubit>(context).resendCode(loginBody, context);
  }
}
