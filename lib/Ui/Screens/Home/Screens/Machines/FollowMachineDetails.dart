import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import '../../../../../Model/Response/HomeResponse/ResellerAssignMachine.dart';
import '../../../../../Repositry/HomeRepositry.dart';
import '../../../../Utils/Progress.dart';
import '../../../../Utils/RoundedButton.dart';
import '../../../../Utils/UtilsFunctions.dart';

class FollowMachineDetails extends StatefulWidget {
  final Datum data;
  final String status;

  const FollowMachineDetails(
      {Key? key, required this.data, required this.status})
      : super(key: key);

  @override
  _FollowMachineDetails createState() => _FollowMachineDetails();
}

class _FollowMachineDetails extends State<FollowMachineDetails> {

  @override
  void initState() {
    super.initState();
    print("here");
  }
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
              "التفاصيل",
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "اسم المكينة",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.machineName.toString(),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  Translations.of(context)!.machineSerial,
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.serial.toString(),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "تاريخ التعاقد",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.actionDate.substring(0, 23),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "تاريخ التسليم",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.machineObtainingDate
                                      .substring(0, 23),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "كود التاجر",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.resellerId.toString(),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "اسم التاجر",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.resellerFullName.toString(),
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "حالة الطلب",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.status,
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  "حالة المكينة",
                                  style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.m_size,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.xs_size,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: (screenWidth / 2) - 40,
                                child: Text(
                                  widget.data.isActive == true
                                      ? "فعالة"
                                      : "غير فعالة",
                                  style: TextStyle(
                                    color: GeneralColor.black,
                                    fontSize: FontSizeFile.m_size,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: SizedBox(
                            width: (screenWidth / 2) - 40,
                            child: Text(
                              "تفاصيل التعاقد",
                              style: TextStyle(
                                  color: GeneralColor.black,
                                  fontSize: FontSizeFile.m_size,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      "نظام التقسيط",
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.xs_size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      widget.data.machineInstallment.toString(),
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.m_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      "نوع التقسيط",
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.xs_size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      widget.data.installmentType.toString(),
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.m_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      "المقدم",
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.xs_size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      widget.data.advance.toString(),
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.m_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      "عدد الاقساط",
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.xs_size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      widget.data.installmentsNumber.toString(),
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.m_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      "قيمة القسط",
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: GeneralColor.black,
                                      fontSize: FontSizeFile.xs_size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: (screenWidth / 2) - 40,
                                    child: Text(
                                      widget.data.installmentValue.toString(),
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.m_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Expanded(child: child),
        ],
      ),
    );
  }
}
