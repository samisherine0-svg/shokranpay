import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReportsCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class Tickets extends StatefulWidget {
  @override
  _Tickets createState() => _Tickets();
}

class _Tickets extends State<Tickets> {
  String fromDate = "";
  String toDate = "";

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String month = now.month.toString();
    if (month.length == 1) {
      month = "0" + month;
    }
    String day = now.day.toString();
    if (day.length == 1) {
      day = "0" + day;
    }
    fromDate = month + "/" + day + "/" + now.year.toString();
    toDate = month + "/" + day + "/" + now.year.toString();
  }
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
            child:
            AppBarCustom(Translations.of(context)!.collectedCommission, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportsCategory()));
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
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: screenWidth,
                          child: Text(
                            Translations.of(context)!.from,
                            style: TextStyle(
                              color: GeneralColor.black,
                              fontSize: FontSizeFile.m_size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 20),
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: GeneralColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                width: 2, color: GeneralColor.secondColor),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fromDate,
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.s_size,
                                ),
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/images/calendar.png',
                                  width: 20,
                                  height: 20,
                                ),
                                onTap: () {
                                  _selectedDateFrom(context);
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: screenWidth,
                          child: Text(
                            Translations.of(context)!.to,
                            style: TextStyle(
                              color: GeneralColor.black,
                              fontSize: FontSizeFile.m_size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 20),
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: GeneralColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                width: 2, color: GeneralColor.secondColor),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                toDate,
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.s_size,
                                ),
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/images/calendar.png',
                                  width: 20,
                                  height: 20,
                                ),
                                onTap: () {
                                  _selectedDateTo(context);
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: RoundedButton(
                            Translations.of(context)!.showTickets,
                                () {
                              // _getTickets();
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
  }

  _selectedDateFrom(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2050, 1),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: GeneralColor.appColor,
                onPrimary: Colors.white,
                surface: GeneralColor.white,
                onSurface: Colors.black,
              ),
              // dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        }).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          String month = pickedDate.month.toString();
          if (month.length == 1) {
            month = "0" + month;
          }
          String day = pickedDate.day.toString();
          if (day.length == 1) {
            day = "0" + day;
          }
          fromDate = month + "/" + day + "/" + pickedDate.year.toString();
        });
      }
      //do whatever you want
    });
  }

  _selectedDateTo(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2050, 1),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: GeneralColor.appColor,
                onPrimary: Colors.white,
                surface: GeneralColor.white,
                onSurface: Colors.black,
              ),
              // dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        }).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          String month = pickedDate.month.toString();
          if (month.length == 1) {
            month = "0" + month;
          }
          String day = pickedDate.day.toString();
          if (day.length == 1) {
            day = "0" + day;
          }
          toDate = month + "/" + day + "/" + pickedDate.year.toString();
        });
      }
    });
  }

}