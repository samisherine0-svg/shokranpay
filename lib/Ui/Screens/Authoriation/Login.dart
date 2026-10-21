import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/AuthorizationCubit/AuthCubit.dart';
import 'package:pioneerspay/Model/Body/AuthorizationBody/LoginBody.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/AppInfoResponse.dart';
import 'dart:io';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Utils/RoundedInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedPasswordField.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/HomeCubit/HomeCubit.dart';

import '../../../Utils/Common.dart';
import 'CreateNewAccount.dart';
import 'WebViewScreen.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passTextEditingController = TextEditingController();
  bool isShow = false;
  late bool saveDate = false;
  late String loginName;
  late String loginPass;
  String deviceID = "";

  @override
  void initState() {
    super.initState();
    getUserPassword();
    _getId();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: GeneralColor.wGrey,
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 25),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/app_logo.png",
                              height: 200,
                              width: 250,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                            child: RoundedInputField(
                              icon: Icons.person,
                              hintText: Translations.of(context)!.userName,
                              onChanged: (value) {},
                              controller: nameTextEditingController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RoundedPasswordField(
                              onChanged: (value) {},
                              controller: passTextEditingController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Row(
                              children: [
                                MediaQuery.removePadding(
                                  context: context,
                                  removeRight: true,
                                  removeLeft: true,
                                  child: Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: GeneralColor.appColor,
                                      value: saveDate,
                                      onChanged: (val) {
                                        setState(() {
                                          saveDate = val!;
                                          // saveRememberPass(val);
                                        });
                                      }),
                                ),
                                Text(
                                  Translations.of(context)!.saveData,
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.s_size,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RoundedButton(
                                Translations.of(context)!.login, () {
                              validateFields();
                            }, GeneralColor.appColor, GeneralColor.white),
                          ),



                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  goToWebViewScreen(link) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewExample(
              link: link,
            )));
  }
  validateFields() async {

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String oldMessage = _prefs.getString(Common.OldMessage) ?? '';
    String userName = nameTextEditingController.text;
    String pass = passTextEditingController.text;
    if (userName.isEmpty || pass.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      LoginBody loginBody = LoginBody(
          userName: userName,
          password: pass,
          rememberMe: saveDate,
          AppId: deviceID,
          IsConfirmationProcess: "0",
          AppType: "2",
          VersionID:Common.version,
          OldSmsCode: oldMessage);
      Progress.show(context);
      BlocProvider.of<AuthCubit>(context).login(loginBody, context);
    }
  }

  Widget technicalSupport(Data data) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            data.whatsNumber != null
                ? Row(
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                          width: 40,
                          height: 40,
                        ),
                        onTap: () {
                          openWhatsapp(data.whatsNumber!);
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  )
                : Container(),
            data.callNumber != null
                ? Row(
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/images/call.png',
                          width: 40,
                          height: 40,
                        ),
                        onTap: () {
                          launch("tel:${data.callNumber!}");
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  )
                : Container(),
            data.telegramPage != null
                ? Row(
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/images/telegram.png',
                          width: 40,
                          height: 40,
                        ),
                        onTap: () {
                          openUrl(data.telegramPage!);
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  )
                : Container(),
            data.facebookPage != null
                ? Row(
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/images/facebook.png',
                          width: 40,
                          height: 40,
                        ),
                        onTap: () {
                          openUrl(data.facebookPage!);
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                    ],
                  )
                : Container(),
          ]),
    );
  }

  Future<void> openUrl(String urlApp) async {
    var url = urlApp;
    if (await launch(url)) {
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openWhatsapp(String number) async {
    var url = 'https://api.whatsapp.com/send?phone=$number';
    if (await launch(url)) {
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceID = iosDeviceInfo.identifierForVendor.toString();
      });
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceID = androidDeviceInfo.id!;
      });
    }
  }

  getUserPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    saveDate = prefs.getBool(Common.isSave) ?? false;
    if (saveDate == true) {
      nameTextEditingController.text = prefs.getString(Common.LoginName) ?? "";
      passTextEditingController.text = prefs.getString(Common.Password) ?? "";
    } else {
      nameTextEditingController.text = "";
      passTextEditingController.text = "";
    }
    setState(() {});
  }
}
