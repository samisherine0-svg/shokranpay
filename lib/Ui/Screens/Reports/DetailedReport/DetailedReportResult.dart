import 'dart:typed_data';

import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Model/Response/ReportsResponse/DetailedReportResponse.dart';
import '../../../../Ui/Widgets/Reports/DetailedReportTile.dart';
import '../../../../Utils/Colors/GeneralColor.dart';
import '../../../../Utils/Common.dart';
import '../../../../Utils/FontSizeFile.dart';
import '../../../../Utils/Language/translation_strings.dart';
import '../../../Utils/AppBarCustom.dart';
import '../../Home/Home.dart';
import 'DetailedReport.dart';
import 'package:image/image.dart' as im;

class DetailedReportResult extends StatefulWidget {
  List<Data> data;

  DetailedReportResult(this.data);

  @override
  _DetailedReportResult createState() => _DetailedReportResult(data);
}

class _DetailedReportResult extends State<DetailedReportResult> {
  List<Data> data;
  List? availableBluetoothDevices = [];
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
  bool connected = false;

  _DetailedReportResult(this.data);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: GeneralColor.appColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedReport()));
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          Translations.of(context)!.detailedReport,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizeFile.m_size,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        Translations.of(context)!.print,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizeFile.m_size,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      getBluetooth();
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            DetailsReportTile(data[index]),
                      ),
                    ),
                  ),
                  printLayout(data),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget printLayout(List<Data> list) {
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
                      return Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "${list.elementAt(index).categoryName!}الاسم : ",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: GeneralColor.black),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              "${list.elementAt(index).transactionCount!}عدد العمليات : ",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: GeneralColor.black),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              "${list.elementAt(index).profitReturn!}العائد بالربح : ",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: GeneralColor.black),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              "${list.elementAt(index).consumer!}المستهلك : ",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: GeneralColor.black),
                            ),
                          ),
                        ],
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
