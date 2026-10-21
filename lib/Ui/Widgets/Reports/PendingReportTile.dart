import 'package:pioneerspay/Ui/Utils/ProgressWidget.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/PendingBillsResponse.dart';

class PendingBillTile extends StatefulWidget {
  Data data;

  PendingBillTile(this.data);

  @override
  _PendingBillTile createState() => _PendingBillTile(data);
}

class _PendingBillTile extends State<PendingBillTile> {
  Data data;

  _PendingBillTile(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: Text(
                data.serviceName!,
                style: TextStyle(
                    color: GeneralColor.black,
                    fontSize: FontSizeFile.xs_size,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              height: 1,
              color: GeneralColor.greyText,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
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
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.printServiceDetailes!.length,
                itemBuilder: (context, index) =>
                    itemTile(data.printServiceDetailes![index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemTile(PrintServiceDetailes item) {
    double screenWidth = MediaQuery.of(context).size.width;
    return item.isSeperator!
        ? Container()
        : Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              children: [
                Container(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    item.key!,
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
                    item.value!,
                    style: TextStyle(
                      color: GeneralColor.greyText,
                      fontSize: FontSizeFile.xs_size,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
  }
}
