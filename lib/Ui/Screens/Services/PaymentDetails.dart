import 'dart:io';
import 'dart:typed_data';

import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/PaymentResponse.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Widgets/Services/PrintSection.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Widgets/Services/DetailsPrintTile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image/image.dart' as im;

class PaymentDetails extends StatefulWidget {
  String serviceID;
  String serviceName;
  Data data;

  PaymentDetails(this.serviceID, this.serviceName, this.data);

  @override
  _PaymentDetails createState() =>
      _PaymentDetails(serviceID, serviceName, data);
}

class _PaymentDetails extends State<PaymentDetails> {
  String serviceID;
  String serviceName;
  Data data;
  bool isCard = false;
  List? availableBluetoothDevices = [];
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotShareController = ScreenshotController();
  Uint8List? _imageFile;
  bool connected = false;

  _PaymentDetails(this.serviceID, this.serviceName, this.data);

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
    List<DetailsPayModel> listPrint = getListDetailsPay(true);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Screenshot(
      controller: screenshotShareController,
      child:  Scaffold(
        backgroundColor: GeneralColor.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
              child: AppBarCustom(
                serviceName,
                    () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      showDetails(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Container(
                                height: 45,
                                width: (screenWidth / 2) - 60,
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
                            InkWell(
                              child: Container(
                                height: 45,
                                width: (screenWidth / 2) - 60,
                                decoration: BoxDecoration(
                                  color: GeneralColor.wGrey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              Home(),
                                        ),
                                            (route) =>
                                        false,
                                      );
                                    },
                                    child: Center(
                                      child:
                                      Text(Translations.of(context)!.share,
                                          style: TextStyle(
                                            color: GeneralColor.appColor,
                                            fontSize: FontSizeFile.xs_size,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      printLayout(listPrint),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),);
  }

  Widget printLayout(List<DetailsPayModel> list) {
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
                  serviceName,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: GeneralColor.black),
                ),
              ),
              isCard
                  ? SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          Translations.of(context)!.chargeCode,
                          style: TextStyle(
                              color: GeneralColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                      Container(
                        child: Text(
                          data.cardVM!.code ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: GeneralColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ))
                  : const SizedBox(
                width: 150,
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
                        child: list.elementAt(index).isSeperator!
                            ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Divider(
                            height: 10,
                            color: GeneralColor.black,
                          ),
                        )
                            : Text(
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
              SizedBox(
                  width: 150,
                  child: Text(
                    "${Translations.of(context)!.operTime} : ${data.printBill!.time}  ${data.printBill!.date}",
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: GeneralColor.black),
                  )),
              SizedBox(
                width: 150,
                child: Divider(
                  height: 10,
                  color: GeneralColor.black,
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    data.printBill!.descriptionAr!.isEmpty
                        ? Container()
                        : Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            data.printBill!.descriptionAr!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: GeneralColor.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: GeneralColor.black,
                        ),
                      ],
                    ),
                    Text(
                      "Powered by " + data.printBill!.poweredByAr!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned.fill(child: _showMainPage()),
    ]);
  }

  Widget showDetails(){
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    List<DetailsPayModel> list = getListDetailsPay(false);
    return Column(children: [
      Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/app_logo.png",
              height: 100,
              width: 200,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              Translations.of(context)!.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSizeFile.m_size,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSizeFile.m_size,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context)!.operDate,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Text(
                  data.date!,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context)!.operTime,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Text(
                  data.time!,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context)!.serviceCode,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Text(
                  serviceID,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context)!.accNumber,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Text(
                  data.printBill!.userCode!.toString(),
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context)!.operNumber,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Text(
                  data.printBill!.transactionId.toString(),
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Divider(
              height: 8,
              color: GeneralColor.black,
            ),
          ),
        ],
      ),
      isCard
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth,
            child: Text(
              Translations.of(context)!.chargeCode,
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSizeFile.xs_size),
            ),
          ),
          Container(
            child: Text(
              data.cardVM!.code ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSizeFile.l_size),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: Text(
          //     Translations.of(context)!.serial,
          //     style: TextStyle(
          //         color: GeneralColor.black,
          //         fontWeight: FontWeight.w700,
          //         fontSize: FontSizeFile.xs_size),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: Text(
          //     data.cardVM!.serial! ?? "",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: GeneralColor.black,
          //         fontWeight: FontWeight.w700,
          //         fontSize: FontSizeFile.m_size),
          //   ),
          // ),
        ],
      )
          : Container(),
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) =>
              DetailsPrintTile(list[index]),
        ),
      ),
      Column(
        children: [
          data.printBill!.descriptionAr!.isEmpty
              ? Container()
              : Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: screenWidth,
                margin:
                const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  data.printBill!.descriptionAr!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.s_size),
                ),
              ),
              Divider(
                height: 8,
                color: GeneralColor.black,
              ),
            ],
          ),
          Text(
            "Powered by " + data.printBill!.poweredByAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: GeneralColor.black,
                fontWeight: FontWeight.w700,
                fontSize: FontSizeFile.s_size),
          ),
          // Divider(
          //   height: 8,
          //   color: GeneralColor.black,
          // )
        ],
      ),
    ],);
  }

  List<DetailsPayModel> getListDetailsPay(bool isPrint) {
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

    if (!isPrint) {
      detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.acceptedNumber,
          value: data.approvalNumber ?? "",
          isSeperator: false);
      list.add(detailsPayModel);
    }
    detailsPayModel = DetailsPayModel(key: "", value: "", isSeperator: true);
    list.add(detailsPayModel);

    if (isPrint) {
      detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.serviceCode,
          value: serviceID,
          isSeperator: false);

      list.add(detailsPayModel);
      detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.accNumber,
          value: "${data.printBill!.userCode} ${data.printBill!.fullName}",
          isSeperator: false);

      list.add(detailsPayModel);
      detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.operNumber,
          value: data.printBill!.transactionId.toString(),
          isSeperator: false);
      list.add(detailsPayModel);
    }

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
                          print("II" + image.toString());

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
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(
        "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
  saveAndShare() async {
    await Permission.storage.request();
    await Permission.accessMediaLocation.request();
    final bytes =
    await screenshotShareController.captureFromWidget(showDetails());
    if (bytes == null) return;

    var directory = '/storage/emulated/0/Download';
    final imagePath =  File('$directory/transaction.png');
    imagePath.writeAsBytesSync(bytes);

    await Share.shareFiles([imagePath.path]);
  }
}
