import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Body/HomeBody/get_deposit_reportes_respone.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReport.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Widgets/Reports/CreditMovementsReportsTile.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import 'followDepositDetails.dart';

class FollowDepositResult extends StatefulWidget {
  GetDepositResponse data;

  FollowDepositResult(this.data);

  @override
  _FollowDepositResult createState() => _FollowDepositResult(data);
}

class _FollowDepositResult extends State<FollowDepositResult> {
  GetDepositResponse data;

  _FollowDepositResult(this.data);

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
              Translations.of(context)!.followDeposits,
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
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.data.length,
                    itemBuilder: (context, index) => Card(
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
                                      "${data.data[index].date.toString().substring(0,10)}",
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
                                      Translations.of(context)!.clientName,
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
                                      data.data[index].clientName,
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
                                      data.data[index].amount.toString(),
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
                                      Translations.of(context)!.creditType,
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
                                      data.data[index].creditType.toString(),
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
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                      data.data[index].status.toString(),
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
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FollowDepositDetails(
                                                  data, index)));
                                  // _showDetails(report.resellerCreditId.toString());
                                },
                                GeneralColor.appColor,
                                GeneralColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
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
