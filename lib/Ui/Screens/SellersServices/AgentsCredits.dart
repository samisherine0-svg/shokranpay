import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class AgentsCredits extends StatefulWidget {
  @override
  _AgentsCredits createState() => _AgentsCredits();
}

class _AgentsCredits extends State<AgentsCredits> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return
      Scaffold(
        backgroundColor: GeneralColor.wGrey,
        body: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
            child: AppBarCustom(Translations.of(context)!.agentsCredits, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SellersServicesCategory()));
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              ),
            ),
          ),
        ]),
      );
  }}