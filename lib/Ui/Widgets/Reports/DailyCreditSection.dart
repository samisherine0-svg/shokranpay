import 'dart:typed_data';

import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/DailyCredit/DailyCreditResponse.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

import '../../../Model/General/GeneralDataModel.dart';
import '../../../Utils/Colors/GeneralColor.dart';
import '../../../Utils/Common.dart';
import '../../../Utils/Language/translation_strings.dart';
import '../../Screens/Home/Home.dart';
import 'package:image/image.dart' as im;

class DailyCreditSection extends StatefulWidget {
  Data data;

  DailyCreditSection(this.data);

  @override
  _DailyCreditSection createState() => _DailyCreditSection(data);
}

class _DailyCreditSection extends State<DailyCreditSection> {
  Data data;
  List? availableBluetoothDevices = [];
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
  bool connected = false;

  _DailyCreditSection(this.data);

  @override
  Widget build(BuildContext context) {
    List<GeneralDataModel> list = getData();
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: GeneralColor.appColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) => dailyCreditTile(list[index]),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Container(
            height: 45,
            width: screenWidth - 60,
            decoration: BoxDecoration(
              color: GeneralColor.appColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  getBluetooth();
                },
                child: Center(
                  child: Text(Translations.of(context)!.print,
                      style: TextStyle(
                        color: GeneralColor.white,
                        fontSize: FontSizeFile.xs_size,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
          ),
        ),
        printLayout(list),
      ],
    );
  }

  Widget printLayout(List<GeneralDataModel> list) {
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
                height: 25,
                child: Text(
                  "سكاي كاش للدفع الالكتروني",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: GeneralColor.black),
                ),
              ),
              SizedBox(
                height: 25,
                child: Text(
                  "يومية حساب",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: GeneralColor.black),
                ),
              ),
              SizedBox(
                width: 150,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 150,
                        child: Text(
                          "${list.elementAt(index).key!} : ${list.elementAt(index).value!}",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: GeneralColor.black),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned.fill(child: _showMainPage()),
    ]);
  }

  dailyCreditTile(GeneralDataModel item) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
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
          SizedBox(
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

  List<GeneralDataModel> getData() {
    List<GeneralDataModel> list = [];
    list.add(GeneralDataModel(
        key: Translations.of(context)!.consumer,
        value: data.consumer.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.retrieved,
        value: data.rejected.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.pending,
        value: data.pending.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.addedBalance,
        value: data.creditAddedFromAdmin.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.discountedCredit,
        value: data.creditDiscountFromAdmin.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.convertedFromHim,
        value: data.creditDiscountFromMeToAgent.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.transformer,
        value: data.creditAddedFromAgentToMe.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.profit,
        value: data.profitReturn.toString()));
    list.add(GeneralDataModel(
        key: Translations.of(context)!.processesNumber,
        value: data.transactionCount.toString()));
    return list;
  }

  getPrinterType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Common.PrinterType) ?? "bluetooth";
  }

  Future<void> getBluetooth() async {
    final List? bluetooths = await BluetoothThermalPrinter.getBluetooths;
    print("Print $bluetooths");
    setState(() {
      availableBluetoothDevices = bluetooths;
    });
    _showDevicesDialog();
  }

  Future<void> setConnect(String mac) async {
    final String? result = await BluetoothThermalPrinter.connect(mac);
    print("state conneected $result");
    if (result == "true") {
      setState(() {
        connected = true;
      });
    }
  }

  _showDevicesDialog() {
    double screenWidth = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: availableBluetoothDevices!.length > 0
                    ? availableBluetoothDevices!.length
                    : 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      String select = availableBluetoothDevices![index];
                      List list = select.split("#");
                      // String name = list[0];
                      String mac = list[1];
                      this.setConnect(mac);

                      screenshotController.capture().then((Uint8List? image) {
                        setState(() {
                          // String dir =
                          // ( getApplicationDocumentsDirectory()).path;
                          // File file = File("$dir/" +
                          // DateTime.now().millisecondsSinceEpoch.toString() +
                          // ".png");
                          // await file.writeAsBytes(image);
                          //

                          // if (image != null) {
                          _imageFile = image;
                        });
                      }).catchError((onError) {
                        print("** err");
                        print(onError);
                      });
                      Future.delayed(Duration(milliseconds: 250), () {
                        printTicket();
                      });
                      refresh();

                      // Navigator.pop(context);
                    },
                    title: Text('${availableBluetoothDevices![index]}'),
                    subtitle: Text("Click to connect"),
                  );
                },
              ),
            ),
          );
        });
  }

  Future<void> printTicket() async {
    String? isConnected = await BluetoothThermalPrinter.connectionStatus;
    if (isConnected == "true") {
      List<int> bytes = await getTicket();
      final result = await BluetoothThermalPrinter.writeBytes(bytes);
      Navigator.of(context, rootNavigator: true).pop();

      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Home(),
        ),
        (route) => false,
      );
      print("Print $result");
    } else {
      print("Print Error");
    }
  }

  Future<List<int>> getTicket() async {
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];
    //Print Image//
    final im.Image? image = im.decodeImage(_imageFile!);
    //////////////////////
    bytes += generator.image(image!);
    bytes += generator.feed(5);
    return bytes;
  }

  refresh() {
    setState(() {});
  }

  _showMainPage() {
    return Container(
      alignment: Alignment.center,
      color: GeneralColor.white,
      child: const Text(
        "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
