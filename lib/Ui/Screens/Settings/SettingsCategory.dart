import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Settings/ChangeLanguage.dart';
import 'package:pioneerspay/Ui/Screens/Settings/ChangePassword.dart';
import 'package:pioneerspay/Ui/Screens/Settings/PrinterSettings.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCategory extends StatefulWidget {
  @override
  _SettingsCategory createState() => _SettingsCategory();
}

class _SettingsCategory extends State<SettingsCategory> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.settings,
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          Translations.of(context)!.changePass,
                          style: TextStyle(
                              color: GeneralColor.black,
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeFile.s_size),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                ),
                // InkWell(
                //   onTap: () {
                //     moveToLanguageSettings();
                //   },
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                //     child: Container(
                //       padding: const EdgeInsets.all(15),
                //       child: Center(
                //         child: Text(
                //           Translations.of(context)!.changeLang,
                //           style: TextStyle(
                //               color: GeneralColor.black,
                //               fontWeight: FontWeight.w700,
                //               fontSize: FontSizeFile.s_size),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // InkWell(
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                //     child: Container(
                //       padding: const EdgeInsets.all(15),
                //       child: Center(
                //         child: Text(
                //           Translations.of(context)!.printerSettings,
                //           style: TextStyle(
                //               color: GeneralColor.black,
                //               fontWeight: FontWeight.w700,
                //               fontSize: FontSizeFile.s_size),
                //         ),
                //       ),
                //     ),
                //   ),
                //   onTap: () {
                //     moveToPrinterSettings();
                //   },
                // ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  moveToPrinterSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String printer = prefs.getString(Common.PrinterType) ?? "bluetooth";
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PrinterSettings(printer)));
  }

  moveToLanguageSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String printer = prefs.getString(Common.LANGUAGE) ?? "ar";
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChangeLanguage(printer)));
  }
}
