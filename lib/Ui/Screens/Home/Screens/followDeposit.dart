import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pioneerspay/Model/Body/HomeBody/get_deposits_body.dart';
import 'package:pioneerspay/Repositry/HomeRepositry.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Ui/Widgets/SellersServices/PhotosSection.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:provider/provider.dart';

import '../../../../Cubit/DepositCubit/deposit_cubit.dart';
import '../../../../Model/Response/HomeResponse/banks_response.dart';
import '../../../../Model/Response/HomeResponse/credit_response.dart';
import '../../../../Provider/ProviderAccount.dart';
import '../../../../Utils/FontSizeFile.dart';
import '../../../Utils/AppBarCustom.dart';
import '../../../Utils/GeneralInputField.dart';
import '../../../Utils/RoundedButton.dart';

class FollowDeposit extends StatefulWidget {
  const FollowDeposit({Key? key}) : super(key: key);

  @override
  _FollowDeposit createState() => _FollowDeposit();
}

class _FollowDeposit extends State<FollowDeposit> {
  CreditResponse? allDepositStatus;
  String fromDate = "";
  String toDate = "";

  @override
  void initState() {
    super.initState();
    getAllDepositStatus();
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
      backgroundColor: GeneralColor.wGrey,
      body: BlocProvider(
          create: (_) => DepositCubit(),
          child: BlocConsumer<DepositCubit, DepositState>(
              listener: (context, state) {},
              builder: (context, state) {
                DepositCubit depositCubit = DepositCubit.get(context);
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
                      child: AppBarCustom(
                          Translations.of(context)!.followDeposits, () {
                        Navigator.pop(context);
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
                                    margin:
                                        const EdgeInsets.fromLTRB(5, 10, 5, 0),
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 2, 0, 20),
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                      color: GeneralColor.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 2,
                                          color: GeneralColor.secondColor),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    margin:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 2, 0, 20),
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                      color: GeneralColor.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 2,
                                          color: GeneralColor.secondColor),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        width: screenWidth,
                                        child: Text(
                                          Translations.of(context)!.status,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: FontSizeFile.s_size,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            2, 0, 2, 5),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: GeneralColor.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              width: 2,
                                              color: GeneralColor.appColor),
                                        ),
                                        child: Center(
                                          child: allDepositStatus == null
                                              ? const CircularProgressIndicator()
                                              : Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 10),
                                                child: DropdownButton(
                                                    underline: const SizedBox(),
                                                    hint: Text(
                                                      depositCubit.dropDownStatus,
                                                      style: TextStyle(
                                                          color:
                                                              GeneralColor.black,
                                                          fontSize: FontSizeFile
                                                              .xs_size,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    isExpanded: true,
                                                    items: allDepositStatus!.data
                                                        .map((data) {
                                                      return DropdownMenuItem(
                                                        onTap: () {
                                                          setState(() {
                                                            depositCubit
                                                                    .dropDownStatus =
                                                                data.key;
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
                                                        depositCubit
                                                                .dropDownStatusId =
                                                            value.toString();
                                                      });
                                                    }),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: RoundedButton(
                                      Translations.of(context)!.viewDeposits,
                                      () {
                                        if (fromDate.isEmpty ||
                                            toDate.isEmpty ||
                                            depositCubit
                                                .dropDownStatusId.isEmpty) {
                                          UtilsFunctions.createToast(
                                              Translations.of(context)!
                                                  .fillAllData);
                                        } else {
                                          GetDepositBody body = GetDepositBody(
                                              dateFrom: fromDate,
                                              dateTo: toDate,
                                              depositStatus: int.parse(
                                                  depositCubit
                                                      .dropDownStatusId));
                                          depositCubit.getDepositReports(
                                              context, body);
                                        }
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
                );
              })),
    );
  }

  getAllDepositStatus() {
    getAllDepositStatusApi().then((value) {
      setState(() {
        allDepositStatus = value;
      });
    }).catchError((onError) {
      getAllDepositStatus();
      print(onError);
    });
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
}
