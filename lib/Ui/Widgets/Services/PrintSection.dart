import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/General/DetailsPayModel.dart';

import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/PaymentResponse.dart';
import 'package:screenshot/screenshot.dart';

class PrintSection extends StatefulWidget {
  String serviceID;
  String serviceName;
  Data data;

  PrintSection(this.serviceID, this.serviceName, this.data);

  @override
  _PrintSection createState() => _PrintSection(serviceID, serviceName, data);
}

class _PrintSection extends State<PrintSection> {
  String serviceID;
  String serviceName;
  Data data;
  bool isCard = false;
  ScreenshotController screenshotController = ScreenshotController();

  _PrintSection(this.serviceID, this.serviceName, this.data);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (data.cardVM == null) {
      isCard = false;
    } else {
      isCard = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DetailsPayModel> list = getListDetailsPay();
    return Stack(children: [
      Screenshot(
        controller: screenshotController,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: 120,
                height: 40,
              ),
              SizedBox(
                height: 30,
                child: Text(
                  serviceName,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: GeneralColor.black),
                ),
              ),
              SizedBox(
                width: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 130,
                      child: Text(
                        "${list.elementAt(index).key!} : ${list.elementAt(index).value!}",
                        style: TextStyle(
                          fontSize: 11,
                          color: GeneralColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned.fill(child: _showMainPage()),
    ]);
  }

  _showMainPage() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text(
        "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  List<DetailsPayModel> getListDetailsPay() {
    List<DetailsPayModel> list = [];

    double total = data.amount! + data.serviceCost!;
    if (!isCard) {
      if (data.printBill!.printServiceDetailes!.isNotEmpty) {
        for (int i = 0; i < data.billDetailes!.length; i++) {
          DetailsPayModel detailsPayModel = DetailsPayModel(
              key: data.printBill!.printServiceDetailes!.elementAt(i).key,
              value: data.printBill!.printServiceDetailes!.elementAt(i).value,
              isSeperator: data.printBill!.printServiceDetailes!
                  .elementAt(i)
                  .isSeperator);
          list.add(detailsPayModel);
        }
      }
    }

    DetailsPayModel detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.amount,
        value: data.printBill!.amount.toString(),
        isSeperator: false);

    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.serviceCost,
        value: data.printBill!.serviceCost.toString(),
        isSeperator: false);
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.totalAmount,
        value: total.toString(),
        isSeperator: false);

    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.refNumber,
        value: data.printBill!.refNumber ?? "",
        isSeperator: false);

    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.acceptedNumber,
        value: data.approvalNumber ?? "",
        isSeperator: false);
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(key: "", value: "", isSeperator: true);
    list.add(detailsPayModel);

    return list;
  }
}
