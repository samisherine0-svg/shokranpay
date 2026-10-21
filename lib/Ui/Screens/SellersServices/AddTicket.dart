import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class AddTicket extends StatefulWidget {
  @override
  _AddTicket createState() => _AddTicket();
}

class _AddTicket extends State<AddTicket> {
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
            child: AppBarCustom(Translations.of(context)!.addTicket, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SellersServicesCategory()));
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: GeneralInputField(
                              text: Translations.of(context)!.title,
                              controller: titleController,
                              textInputType: TextInputType.text, readOnly: false,),
                        ),
                        Container(
                          width: screenWidth,
                          margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
                          child: Text(
                            Translations.of(context)!.description,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSizeFile.s_size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: GeneralColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                width: 2, color: GeneralColor.secondColor),
                          ),
                          child: Center(
                            child: TextField(
                              maxLines: 4,
                              controller: descriptionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: RoundedButton(
                            Translations.of(context)!.add,
                                () {
                              // _validate();
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
          ),
        ]),
      );
  }}