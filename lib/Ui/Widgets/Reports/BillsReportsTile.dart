import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/BillsReportsResponse.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReportsDetails.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class BillsReportsTile extends StatefulWidget {
  Data data;

  BillsReportsTile(this.data);

  @override
  _BillsReportsTile createState() =>
      _BillsReportsTile(data);
}

class _BillsReportsTile extends State<BillsReportsTile> {
  Data data;

  _BillsReportsTile(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.date,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      "${data.time!} ${data.date!}",
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.status,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.transactionStatus!,
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.amount,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.amount.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      Translations.of(context)!.commission,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.xs_size,
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
                  Container(
                    width: (screenWidth / 2) - 40,
                    child: Text(
                      data.commission.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: RoundedButton(
                Translations.of(context)!.details,
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BillsReportsDetails(data)));                },
                GeneralColor.appColor,
                GeneralColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
