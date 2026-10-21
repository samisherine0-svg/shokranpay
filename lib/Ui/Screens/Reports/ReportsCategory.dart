import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReport.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ViewReceipts.dart';
import 'package:pioneerspay/Ui/Screens/Reports/DailyCredit/DailyCredits.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReturnedReports/ReturnedReports.dart';
import 'package:pioneerspay/Ui/Screens/Reports/Search/Search.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CollectedCommission.dart';
import 'package:pioneerspay/Ui/Screens/Reports/PendingBills.dart';
import 'package:pioneerspay/Ui/Screens/Reports/Tickets/Tickets.dart';
import 'package:pioneerspay/Ui/Screens/Reports/DetailedReport/DetailedReport.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class ReportsCategory extends StatefulWidget {
  @override
  _ReportsCategory createState() => _ReportsCategory();
}

class _ReportsCategory extends State<ReportsCategory> {
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
              Translations.of(context)!.reports,
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
                            Translations.of(context)!.transactionsReports,
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
                              builder: (context) => CreditMovementsReport(userCode: '',)));
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
                            Translations.of(context)!.billsReports,
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
                              builder: (context) => BillsReports()));
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
                            Translations.of(context)!.pendingBills,
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
                              builder: (context) => PendingBills()));
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
                            Translations.of(context)!.collectedCommission,
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
                              builder: (context) => CollectedCommission()));
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
                            Translations.of(context)!.showReceipts,
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
                              builder: (context) => ViewReceipts()));
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
                            Translations.of(context)!.search,
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
                              builder: (context) => Search()));
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
                            Translations.of(context)!.showTickets,
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
                              builder: (context) => Tickets()));
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
                            Translations.of(context)!.returnedReports,
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
                              builder: (context) => ReturnedReports()));
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
                            Translations.of(context)!.dailyCredit,
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
                              builder: (context) => DailyCredit()));
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
                            Translations.of(context)!.detailedReport,
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
                              builder: (context) => DetailedReport()));
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
