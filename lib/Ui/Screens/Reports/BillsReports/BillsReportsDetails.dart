import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/BillsReportsResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Widgets/Services/DetailsPayTile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class BillsReportsDetails extends StatefulWidget {
  Data data;

  BillsReportsDetails(this.data);

  @override
  _BillsReportsDetails createState() => _BillsReportsDetails(data);
}

class _BillsReportsDetails extends State<BillsReportsDetails> {
  Data data;

  _BillsReportsDetails(this.data);

  @override
  Widget build(BuildContext context) {
    List<DetailsPayModel> list = getListDetailsPay();
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) =>
                              DetailsPayTile(list[index]),
                        ),
                      ),
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
  List<DetailsPayModel> getListDetailsPay() {
    List<DetailsPayModel> list = [];

    double total = data.amount! + data.serviceCost!;

    DetailsPayModel detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.amount, value: data.amount.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.serviceCost,
        value: data.serviceCost.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.commission,
        value: data.commission.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.totalAmount, value: total.toString());
    list.add(detailsPayModel);   detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.status, value: data.transactionStatus.toString());
    list.add(detailsPayModel);

    if (data.printServiceDetailes!.isNotEmpty) {
      for (int i = 0; i < data.printServiceDetailes!.length; i++) {
        detailsPayModel = DetailsPayModel(
            key: data.printServiceDetailes!.elementAt(i).key,
            value: data.printServiceDetailes!.elementAt(i).value);
        list.add(detailsPayModel);
      }
    }
    return list;
  }

}
