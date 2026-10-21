import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';

import '../../../Model/Response/ReportsResponse/DetailedReportResponse.dart';
import '../../../Utils/FontSizeFile.dart';
import '../../../Utils/Language/translation_strings.dart';
import '../../Utils/RoundedButton.dart';

class DetailsReportTile extends StatefulWidget {
  Data data;

  DetailsReportTile(this.data);

  @override
  _DetailsReportTile createState() => _DetailsReportTile(data);
}

class _DetailsReportTile extends State<DetailsReportTile> {
  Data data;

  _DetailsReportTile(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: GeneralColor.appColor),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              children: [
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    Translations.of(context)!.name,
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    data.categoryName!,
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    Translations.of(context)!.processesNumber,
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    data.transactionCount.toString(),
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    Translations.of(context)!.profit,
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
                    data.profitReturn.toString(),
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    Translations.of(context)!.consumer,
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
                SizedBox(
                  width: (screenWidth / 2) - 40,
                  child: Text(
                    data.consumer.toString(),
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

        ],
      ),
    );
  }
}
