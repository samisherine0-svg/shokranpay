import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReportsCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class ViewReceipts extends StatefulWidget {
  @override
  _ViewReceipts createState() => _ViewReceipts();
}

class _ViewReceipts extends State<ViewReceipts> {
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
            child: AppBarCustom(Translations.of(context)!.showReceipts, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ReportsCategory()));
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