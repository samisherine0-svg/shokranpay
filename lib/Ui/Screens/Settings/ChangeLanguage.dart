import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Screens/Settings/SettingsCategory.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:pioneerspay/main.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends StatefulWidget {
  String lang;

  ChangeLanguage(this.lang);

  @override
  _ChangeLanguage createState() => _ChangeLanguage(lang);
}

class _ChangeLanguage extends State<ChangeLanguage> {
  String lang;

  _ChangeLanguage(this.lang);

  int val = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (lang == "en") {
      val = 2;
    } else {
      val = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(Translations.of(context)!.changeLang, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsCategory()));
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ScopedModelDescendant<AppModel>(
                  builder: (context, child, model) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
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
                                Translations.of(context)!.arabic,
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
                                Translations.of(context)!.english,
                                style: TextStyle(
                                    color: GeneralColor.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: FontSizeFile.s_size),
                              ),
                            ],
                          ),
                          Container(
                            child: RoundedButton(
                              Translations.of(context)!.change,
                              () {
                                print("val" + val.toString());
                                if (val == 1) {
                                  lang = "ar";
                                } else {
                                  lang = "en";
                                }

                                print("lang" + lang);
                                changeLanguage(lang);
                                model.changeDirection(lang);
                                RestartWidget.restartApp(context);
                              },
                              GeneralColor.appColor,
                              GeneralColor.white,
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  changeLanguage(String lang) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(Common.LANGUAGE, lang);
  }
}
