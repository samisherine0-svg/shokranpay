import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReport.dart';
import 'package:pioneerspay/Ui/Screens/Reports/PendingBills.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/AddTicket.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/AgentsCredits.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/CreditTransfer.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/UploadReceipt.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import 'CreateNewAgentUnderAgent.dart';

class SellersServicesCategory extends StatefulWidget {
  @override
  _SellersServicesCategory createState() => _SellersServicesCategory();
}

class _SellersServicesCategory extends State<SellersServicesCategory> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.sellersServices,
                  () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            Translations.of(context)!.createNewAcc,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeFile.s_size),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewAgentUnderAgent()));
                    },
                  ),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            Translations.of(context)!.uploadReceipt,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeFile.s_size),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadReceipt()));
                    },
                  ),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            Translations.of(context)!.addTicket,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeFile.s_size),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTicket()));
                    },
                  ),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            Translations.of(context)!.transferBalance,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeFile.s_size),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransferCredit(userCode: '', userName: '', shopName: '',)));
                    },
                  ),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            Translations.of(context)!.agentsCredits,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeFile.s_size),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgentsCredits()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
