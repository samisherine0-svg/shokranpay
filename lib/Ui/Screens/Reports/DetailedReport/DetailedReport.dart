import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/DetailedReportBody.dart';

import '../../../../Cubit/ReportsCubit/ReportsCubit.dart';
import '../../../../Utils/Colors/GeneralColor.dart';
import '../../../../Utils/FontSizeFile.dart';
import '../../../../Utils/Language/translation_strings.dart';
import '../../../Utils/AppBarCustom.dart';
import '../ReportsCategory.dart';

class DetailedReport extends StatefulWidget {
  @override
  _DetailedReport createState() => _DetailedReport();
}

class _DetailedReport extends State<DetailedReport> {
  String fromDate = "";
  String toDate = "";

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String month = now.month.toString();
    if (month.length == 1) {
      month = "0$month";
    }
    String day = now.day.toString();
    if (day.length == 1) {
      day = "0$day";
    }

    fromDate = "${now.year}-$month-$day";
    toDate = "${now.year}-$month-$day";
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.detailedReport,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportsCategory()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: GeneralColor.appColor),
                  borderRadius: BorderRadius.circular(15.0),
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
                          Translations.of(context)!.showReports,
                          () {
                            _getReports();
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
        ],
      ),
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
          fromDate = pickedDate.year.toString() + "-" + month + "-" + day;
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
          toDate = pickedDate.year.toString() + "-" + month + "-" + day;
        });
      }
      //do whatever you want
    });
  }

  _getReports() {
    DetailedReportBody body =
        DetailedReportBody(dateFrom: fromDate, dateTo: toDate);
    Progress.show(context);
    BlocProvider.of<ReportsCubit>(context).getDetailedReport(context, body);
  }
}
