import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Reports/BillsReports/BillsReports.dart';

import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Widgets/Services/DetailsPayTile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image/image.dart' as im;
import 'dart:typed_data';
import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class CreditMovementsReportDetails extends StatefulWidget {
  Data data;
  String netAfter;
  String netBefore;

  CreditMovementsReportDetails(this.data, this.netAfter, this.netBefore);

  @override
  _CreditMovementsReportDetails createState() =>
      _CreditMovementsReportDetails(data);
}

class _CreditMovementsReportDetails
    extends State<CreditMovementsReportDetails> {
  Data data;
  List? availableBluetoothDevices = [];
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotShareController = ScreenshotController();
  Uint8List? _imageFile;
  bool connected = false;
  bool isCard = false;
  _CreditMovementsReportDetails(this.data);

  @override
  Widget build(BuildContext context) {
    List<DetailsPayModel> listPrint = getListDetailsPay(true);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Screenshot(
      controller: screenshotShareController,
      child: Scaffold(
        backgroundColor: GeneralColor.wGrey,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
              child: AppBarCustom(
                Translations.of(context)!.transactionsReports,
                () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: showTable(),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       InkWell(
                    //         child: Container(
                    //           height: 45,
                    //           width: (screenWidth / 2) - 60,
                    //           decoration: BoxDecoration(
                    //             color: GeneralColor.appColor,
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //           child: Material(
                    //             color: Colors.transparent,
                    //             child: InkWell(
                    //               onTap: () {
                    //                 getBluetooth();
                    //               },
                    //               child: Center(
                    //                 child: Text(Translations.of(context)!.print,
                    //                     style: TextStyle(
                    //                       color: GeneralColor.white,
                    //                       fontSize: FontSizeFile.xs_size,
                    //                       fontWeight: FontWeight.w700,
                    //                     )),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       InkWell(
                    //         child: Container(
                    //           height: 45,
                    //           width: (screenWidth / 2) - 60,
                    //           decoration: BoxDecoration(
                    //             color: GeneralColor.white,
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //           child: Material(
                    //             color: Colors.transparent,
                    //             child: InkWell(
                    //               onTap: () {
                    //                 saveAndShare();
                    //
                    //               },
                    //               child: Center(
                    //                 child: Text(Translations.of(context)!.share,
                    //                     style: TextStyle(
                    //                       color: GeneralColor.appColor,
                    //                       fontSize: FontSizeFile.xs_size,
                    //                       fontWeight: FontWeight.w700,
                    //                     )),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // printLayout(listPrint),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget printLayout(List<DetailsPayModel> list) {
  //   return Stack(children: [
  //     Screenshot(
  //       controller: screenshotController,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: Column(
  //           children: [
  //             Image.asset(
  //               'assets/images/app_logo.png',
  //               width: 120,
  //               height: 40,
  //             ),
  //             SizedBox(
  //               height: 25,
  //               child: Text(
  //                 data.serviceName!,
  //                 style: TextStyle(
  //                     fontSize: 11,
  //                     fontWeight: FontWeight.bold,
  //                     color: GeneralColor.black),
  //               ),
  //             ),
  //             // isCard
  //             //     ? SizedBox(
  //             //     width: 150,
  //             //     child: Column(
  //             //       children: [
  //             //         SizedBox(
  //             //           width: 150,
  //             //           child: Text(
  //             //             Translations.of(context)!.chargeCode,
  //             //             style: TextStyle(
  //             //                 color: GeneralColor.black,
  //             //                 fontWeight: FontWeight.bold,
  //             //                 fontSize: 10),
  //             //           ),
  //             //         ),
  //             //         Container(
  //             //           child: Text(
  //             //             data.cardVM!.code! ?? "",
  //             //             textAlign: TextAlign.center,
  //             //             style: TextStyle(
  //             //                 color: GeneralColor.black,
  //             //                 fontWeight: FontWeight.bold,
  //             //                 fontSize: 14),
  //             //           ),
  //             //         ),
  //             //         // Text(
  //             //         //   "${Translations.of(context)!.serial} : ${data.cardVM!.serial! ?? ""}",
  //             //         //   style: TextStyle(
  //             //         //       fontSize: 10,
  //             //         //       fontWeight: FontWeight.bold,
  //             //         //       color: GeneralColor.black),
  //             //         // )
  //             //       ],
  //             //     ))
  //             //     : const SizedBox(
  //             //   width: 150,
  //             // ),
  //             SizedBox(
  //               width: 150,
  //               child: MediaQuery.removePadding(
  //                 context: context,
  //                 removeTop: true,
  //                 child: ListView.builder(
  //                   shrinkWrap: true,
  //                   itemCount: list.length,
  //                   itemBuilder: (context, index) {
  //                     return SizedBox(
  //                       width: 150,
  //                       child: list.elementAt(index).isSeperator!
  //                           ? Container(
  //                         margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
  //                         child: Divider(
  //                           height: 10,
  //                           color: GeneralColor.black,
  //                         ),
  //                       )
  //                           : Text(
  //                         "${list.elementAt(index).key!} : ${list.elementAt(index).value!}",
  //                         style: TextStyle(
  //                             fontSize: 10,
  //                             fontWeight: FontWeight.bold,
  //                             color: GeneralColor.black),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //                 width: 150,
  //                 child: Text(
  //                   "${Translations.of(context)!.operTime} : ${data.time!}  ${data.date!}",
  //                   style: TextStyle(
  //                       fontSize: 9,
  //                       fontWeight: FontWeight.bold,
  //                       color: GeneralColor.black),
  //                 )),
  //             SizedBox(
  //               width: 150,
  //               child: Divider(
  //                 height: 10,
  //                 color: GeneralColor.black,
  //               ),
  //             ),
  //             SizedBox(
  //               width: 150,
  //               child: Column(
  //                 children: [
  //                   data.descriptionAr!.isEmpty
  //                       ? Container()
  //                       : Column(
  //                     children: [
  //                       Container(
  //                         alignment: Alignment.center,
  //                         margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
  //                         child: Text(
  //                           data.descriptionAr!,
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(
  //                               color: GeneralColor.black,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 10),
  //                         ),
  //                       ),
  //                       Divider(
  //                         height: 10,
  //                         color: GeneralColor.black,
  //                       ),
  //                     ],
  //                   ),
  //                   Text(
  //                     "Powered by ${data.poweredByAr!}",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         color: GeneralColor.black,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 10),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     Positioned.fill(child: _showMainPage()),
  //   ]);
  // }

  Widget showTable() {
    List<DetailsPayModel> list = getListDetailsPay(false);
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FlexColumnWidth(2.5),
        1: FlexColumnWidth(3),
      },
      children: List<TableRow>.generate(
        list.length,
        (index) {
          final item = list[index];
          return TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  item.key!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: SelectableText(
                  item.value!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ),
            ],
          );
        },
        growable: false,
      ),
    );
  }

  List<DetailsPayModel> getListDetailsPay(bool isPrint) {

    List<DetailsPayModel> list = [];

    if (data.printServiceDetailes != null &&
        data.printServiceDetailes!.isNotEmpty) {
      for (int i = 0; i < data.printServiceDetailes!.length; i++) {
        if (!data.printServiceDetailes!.elementAt(i).isSeperator!) {
          DetailsPayModel detailsPayModel = DetailsPayModel(
              key: data.printServiceDetailes!.elementAt(i).key,
              value: data.printServiceDetailes!.elementAt(i).value,
              isSeperator: data.printServiceDetailes!.elementAt(i).isSeperator);
          list.add(detailsPayModel);
        }
      }
    }
    if (data.printServiceDetailes![0].value!.contains("تحويل رصيد") ||
        data.printServiceDetailes![0].value!.contains("استلام رصيد")) {
      DetailsPayModel detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.operTime,
          value: data.date.toString() + " " + data.time.toString(),
          isSeperator: false);
      list.add(detailsPayModel);
    } else {
      double totalAmount = data.amount! + data.serviceCost!;
      String inString = totalAmount.toStringAsFixed(2);
      double total = double.parse(inString);
      DetailsPayModel detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.amount,
          value: data.amount.toString(),
          isSeperator: false);
      list.add(detailsPayModel);
      isCard
          ? null
          : detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.serviceCost,
          value: data.serviceCost.toString(),
          isSeperator: false);
      isCard ? null : list.add(detailsPayModel);
      // detailsPayModel = DetailsPayModel(
      //     key: Translations.of(context)!.commission,
      //     value: data.commission.toString(),
      //     isSeperator: false);
      // list.add(detailsPayModel);
      isCard
          ? null
          : detailsPayModel = DetailsPayModel(
          key: Translations.of(context)!.totalAmount,
          value: total.toString(),
          isSeperator: false);
      isCard ? null : list.add(detailsPayModel);
      if (!isPrint) {
        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.commission,
            value: data.commission.toString(),
            isSeperator: false);
        list.add(detailsPayModel);
        detailsPayModel = DetailsPayModel(
            key: "المخصوم",
            value: (total - (data.commission!)).toStringAsFixed(2),
            isSeperator: false);

        list.add(detailsPayModel);
        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.status,
            value: data.transactionStatus.toString(),
            isSeperator: false);
        list.add(detailsPayModel);

        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.operNumber,
            value: data.transactionId.toString(),
            isSeperator: false);
        list.add(detailsPayModel);

        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.operTime,
            value: "${data.date.toString()} - ${data.time.toString()}",
            isSeperator: false);
        list.add(detailsPayModel);

        widget.netBefore.isEmpty
            ? null
            : detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.balanceBefore,
            value: "${widget.netBefore.toString()}",
            isSeperator: false);
        widget.netBefore.isEmpty ? null : list.add(detailsPayModel);
        widget.netAfter.isEmpty
            ? null
            : detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.balanceAfter,
            value: "${widget.netAfter.toString()}",
            isSeperator: false);
        widget.netAfter.isEmpty ? null : list.add(detailsPayModel);
      }
      // detailsPayModel = DetailsPayModel(
      //     key: Translations.of(context)!.refNumber,
      //     value: data.r ?? "",
      //     isSeperator: false);
      //
      // list.add(detailsPayModel);
      if (isPrint) {
        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.operNumber,
            value: data.transactionId.toString(),
            isSeperator: false);
        list.add(detailsPayModel);
        detailsPayModel = DetailsPayModel(key: "", value: "", isSeperator: true);
        list.add(detailsPayModel);
      }
      if (!isPrint) {
        detailsPayModel = DetailsPayModel(
            key: Translations.of(context)!.accNumber,
            value: "${data.fullName}",
            isSeperator: false);
        list.add(detailsPayModel);
        detailsPayModel = DetailsPayModel(
            key: "الموبايل", value: "${data.phoneNumber}", isSeperator: false);

        list.add(detailsPayModel);
      }
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
      color: GeneralColor.wGrey,
      child: const Text(
        "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  saveAndShare() async {
    await Permission.storage.request();
    await Permission.accessMediaLocation.request();
    // await Permission.manageExternalStorage.request();

    final bytes =
        await screenshotShareController.captureFromWidget(showTable());
    if (bytes == null) return;

    var directory = '/storage/emulated/0/Download';
    final imagePath = File('$directory/transaction.png');
    imagePath.writeAsBytesSync(bytes);

    await Share.shareFiles([imagePath.path]);
  }
// Future<bool> _hasAcceptedPermissions() async {
//   if (Platform.isAndroid) {
//     if (await _requestPermission(Permission.storage) &&
//         // access media location needed for android 10/Q
//         await _requestPermission(Permission.accessMediaLocation) &&
//         // manage external storage needed for android 11/R
//         await _requestPermission(Permission.manageExternalStorage)) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//   if (Platform.isIOS) {
//     if (await _requestPermission(Permission.photos)) {
//       return true;
//     } else {
//       return false;
//     }
//   } else {
//     // not android or ios
//     return false;
//   }}
}
