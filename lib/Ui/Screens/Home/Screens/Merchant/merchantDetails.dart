import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../../../Model/Body/HomeBody/merchant_list_response.dart';
import '../../../../Utils/RoundedButton.dart';
import '../../../Reports/CreditMovementsReport/CreditMovementsReport.dart';
import '../../../SellersServices/CreditTransfer.dart';
import '../followDepositDetails.dart';

class MarchantDetails extends StatefulWidget {
  Datum data;

  MarchantDetails({Key? key, required this.data}) : super(key: key);

  @override
  _MarchantDetails createState() => _MarchantDetails();
}

class _MarchantDetails extends State<MarchantDetails> {
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
              "بيانات التاجر",
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.merchantCode,
                                widget.data.userCode.toString()),
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.name,
                                "${widget.data.firstName} ${widget.data.lastName}"),
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.phoneNum,
                                widget.data.phoneNumber ?? ""),
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.accountDateOpen,
                                widget.data.registrationDate.date),
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.machineType,
                                widget.data.machineType),
                            merchantItem(
                                screenWidth,
                                Translations.of(context)!.machineSerial,
                                widget.data.machineSerial),
                            merchantItem(screenWidth, "نوع الشريحة",
                                widget.data.slideType),
                            merchantItem(screenWidth, "رقم الشريحة",
                                widget.data.slideNumber),
                            merchantItem(
                                screenWidth,
                                "حالة التاجر",
                                widget.data.isActive == true
                                    ? "فعال"
                                    : "موقوف"),
                            merchantItem(
                                screenWidth, "نوع التاجر", widget.data.role),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: RoundedButton(
                                      "تحويل رصيد",
                                      () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TransferCredit(
                                                      userName:
                                                          "${widget.data.firstName} ${widget.data.lastName}",
                                                      userCode: widget
                                                          .data.userCode
                                                          .toString(), shopName: widget.data.ShopName??"-",
                                                    )));
                                      },
                                      GeneralColor.appColor,
                                      GeneralColor.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: RoundedButton(
                                      "تقريرالعمليات",
                                      () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreditMovementsReport(
                                                      userCode: widget
                                                          .data.userCode
                                                          .toString(),
                                                    )));
                                      },
                                      GeneralColor.appColor,
                                      GeneralColor.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
          // Expanded(child: child),
        ],
      ),
    );
  }

  Widget merchantItem(screenWidth, key, value) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: [
          SizedBox(
            width: (screenWidth / 2) - 40,
            child: Text(
              key,
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
              fontSize: FontSizeFile.m_size,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: (screenWidth / 2) - 40,
            child: Text(
              value ?? "",
              style: TextStyle(
                color: GeneralColor.black,
                fontSize: FontSizeFile.m_size,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
