import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/BillsReportsResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';
import 'package:pioneerspay/Ui/Widgets/Reports/BillsReportsTile.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class BillsReportsResult extends StatefulWidget {
  List<Data> data;

  BillsReportsResult(this.data);

  @override
  _BillsReportsResult createState() => _BillsReportsResult(data);
}

class _BillsReportsResult extends State<BillsReportsResult> {
  List<Data> data;

  _BillsReportsResult(this.data);

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
              Translations.of(context)!.billsReports,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BillsReports()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) =>
                        BillsReportsTile(data[index]),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
