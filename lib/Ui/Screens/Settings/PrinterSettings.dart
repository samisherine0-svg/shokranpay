import 'package:pioneerspay/Ui/Screens/Settings/SettingsCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterSettings extends StatefulWidget {
  String printer;

  PrinterSettings(this.printer);

  @override
  _PrinterSettings createState() => _PrinterSettings(printer);
}

class _PrinterSettings extends State<PrinterSettings> {
  int val = -1;

  String printer;

  _PrinterSettings(this.printer);

  @override
  void initState() {
    super.initState();
    if (printer == "bluetooth") {
      val = 1;
    } else {
      val = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(Translations.of(context)!.printerSettings, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SettingsCategory()));
            }),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        Translations.of(context)!.choosePrinter,
                        style: TextStyle(
                            color: GeneralColor.appColor,
                            fontWeight: FontWeight.w700,
                            fontSize: FontSizeFile.m_size),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: val,
                          onChanged: (int? value) {
                            setState(() {
                              val = value!;
                            });
                          },
                          activeColor: GeneralColor.appColor,
                        ),
                        Text(
                          Translations.of(context)!.bluetoothPrinter,
                          style: TextStyle(
                              color: GeneralColor.black,
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeFile.s_size),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (int? value) {
                            setState(() {
                              val = value!;
                            });
                          },
                          activeColor: GeneralColor.appColor,
                        ),
                        Text(
                          Translations.of(context)!.mobiwirePrinter,
                          style: TextStyle(
                              color: GeneralColor.black,
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeFile.s_size),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
                    RoundedButton(Translations.of(context)!.confirm, () {
                      changePrinter();
                    }, GeneralColor.appColor, GeneralColor.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  changePrinter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (val == 1) {
      prefs.setString(Common.PrinterType, "bluetooth");
    } else {
      prefs.setString(Common.PrinterType, "mobiwire");
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
