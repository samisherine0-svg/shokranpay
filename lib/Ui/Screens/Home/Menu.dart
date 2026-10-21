import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReport.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReportsCategory.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Screens/Settings/SettingsCategory.dart';
import 'package:pioneerspay/Ui/Screens/Home/PersonalProfile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class Menu extends StatefulWidget {
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    width: 180,
                    height: 100,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: 15,
                            height: 15,
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: GeneralColor.appColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Translations.of(context)!.personalProfile,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.appColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeFile.m_size),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PersonalProfile()));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: 15,
                            height: 15,
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: GeneralColor.appColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Translations.of(context)!.reports,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.appColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeFile.m_size),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ReportsCategory()));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: 15,
                            height: 15,
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: GeneralColor.appColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Translations.of(context)!.sellersServices,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.appColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeFile.m_size),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SellersServicesCategory()));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: 15,
                            height: 15,
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: GeneralColor.appColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Translations.of(context)!.settings,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.appColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeFile.m_size),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsCategory()));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                    ),
                    // InkWell(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //         width: 15,
                    //         height: 15,
                    //         child: Icon(
                    //           Icons.double_arrow_sharp,
                    //           color: GeneralColor.appColor,
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: const EdgeInsets.all(5),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           Translations.of(context)!.transactionsReports,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               color: GeneralColor.appColor,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: FontSizeFile.m_size),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     Navigator.pushAndRemoveUntil<dynamic>(
                    //       context,
                    //       MaterialPageRoute<dynamic>(
                    //         builder: (BuildContext context) =>
                    //             CreditMovementsReport(),
                    //       ),
                    //       (route) =>
                    //           false, //if you want to disable back feature set to false
                    //     );
                    //   },
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    // ),
                    // InkWell(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //         width: 15,
                    //         height: 15,
                    //         child: Icon(
                    //           Icons.double_arrow_sharp,
                    //           color: GeneralColor.appColor,
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: const EdgeInsets.all(5),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           Translations.of(context)!.billsReports,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               color: GeneralColor.appColor,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: FontSizeFile.m_size),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     Navigator.pushAndRemoveUntil<dynamic>(
                    //       context,
                    //       MaterialPageRoute<dynamic>(
                    //         builder: (BuildContext context) =>
                    //             BillsReports(),
                    //       ),
                    //           (route) =>
                    //       false, //if you want to disable back feature set to false
                    //     );
                    //   },
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    // ),
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: 15,
                            height: 15,
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: GeneralColor.appColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Translations.of(context)!.logout,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.appColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeFile.m_size),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Common.logout();

                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => Login(),
                          ),
                          (route) =>
                              false, //if you want to disable back feature set to false
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
