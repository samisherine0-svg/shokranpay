import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ReportsCubit/ReportsCubit.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/CreditMovementsReportBody.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';

import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../../Model/Response/HomeResponse/credit_response.dart';
import '../../../../Repositry/HomeRepositry.dart';

class CreditMovementsReport extends StatefulWidget {
  final String userCode;

  const CreditMovementsReport({Key? key, required this.userCode}) : super(key: key);
  @override
  _CreditMovementsReport createState() => _CreditMovementsReport();
}

class _CreditMovementsReport extends State<CreditMovementsReport> {
  String fromDate = "";
  String toDate = "";
  CreditResponse? creditResponse;
  String dropDownType = '';
  String dropDownTypeId = '';
  getCredit() {
    getCreditApi().then((value) {
      setState(() {
        creditResponse = value;
      });
    }).catchError((onError) {
      getCredit();
      print(onError);
    });
  }
  @override
  void initState() {
    super.initState();
    getCredit();
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
    Size size = MediaQuery.of(context).size;

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
                Translations.of(context)!.transactionsReports,
                () {
                  Navigator.pop(context);
                },
              ),
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
                                fontSize: FontSizeFile.s_size,
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
                                fontSize: FontSizeFile.s_size,
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
                          Column(
                            children: [
                              Container(
                                width: size.width,
                                child: Text(
                                  Translations.of(context)!.creditType,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSizeFile.s_size,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: GeneralColor.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      width: 2, color: GeneralColor.appColor),
                                ),
                                child: Center(
                                  child: creditResponse == null
                                      ? const CircularProgressIndicator()
                                      : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: DropdownButton(
                                        underline: const SizedBox(),
                                        hint: Center(
                                          child: Text(
                                            dropDownType,
                                            style: TextStyle(
                                                color: GeneralColor.black,
                                                fontSize:
                                                FontSizeFile.xs_size,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        isExpanded: true,
                                        items:
                                        creditResponse!.data.map((data) {
                                          return DropdownMenuItem(
                                            onTap: () {
                                              setState(() {
                                                dropDownType = data.key;
                                              });
                                            },
                                            child: Center(
                                                child: Text(
                                                  data.key,
                                                )),
                                            value: data.value,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            dropDownTypeId = value.toString();
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ],
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
            ),
          ],
        ));
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
    if(dropDownTypeId.isEmpty){
      UtilsFunctions.createToast("أختر نوع الرصيد");
    }else{
      CreditMovementsReportBody body =
      CreditMovementsReportBody(dateFrom: fromDate, dateTo: toDate, creditType: dropDownTypeId, userCode: widget.userCode.isEmpty?"0":widget.userCode);
      Progress.show(context);
      BlocProvider.of<ReportsCubit>(context)
          .getCreditMovementReports(context, "V1", body);
    }


  }
}
