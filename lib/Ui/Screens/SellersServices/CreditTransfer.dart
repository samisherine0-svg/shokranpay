import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Body/HomeBody/transfer_body.dart';
import 'package:pioneerspay/Model/Response/AuthorizationResponse/CreateNewAccountResponse.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/credit_response.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:http/http.dart' as http;

import '../../../Repositry/HomeRepositry.dart';
import '../../Utils/Progress.dart';

class TransferCredit extends StatefulWidget {
  final String userCode;
  final String userName;
  final String shopName;

  const TransferCredit(
      {Key? key, required this.userCode, required this.userName, required this.shopName})
      : super(key: key);

  @override
  _TransferCredit createState() => _TransferCredit();
}

class _TransferCredit extends State<TransferCredit> {
  TextEditingController centerNumController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  CreditResponse? creditResponse;
  String dropDownType = '';
  String dropDownTypeId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    centerNumController.text = widget.userCode;
    userNameController.text = widget.userName;
    shopNameController.text = widget.shopName;
    getCredit();
  }

  getCredit() {
    getCreditApi().then((value) {
      setState(() {
        creditResponse = value;
      });
    }).catchError((onError) {
      getCredit();
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenWidth = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
          child: AppBarCustom(Translations.of(context)!.transferBalance, () {
            Navigator.pop(context);
          }),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      widget.userCode.isEmpty
                          ? Column(
                              children: [
                                Container(
                                  width: size.width,
                                  child: Text(
                                    "رقم المستخدم",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: FontSizeFile.s_size,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: GeneralColor.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        width: 2, color: GeneralColor.appColor),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      readOnly:
                                          userNameController.text.isNotEmpty
                                              ? true
                                              : false,
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontSizeFile.l_size),
                                      textAlign: TextAlign.center,
                                      controller: centerNumController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: GeneralInputField(
                                  text: "رقم المستخدم",
                                  controller: centerNumController,
                                  textInputType: TextInputType.number,
                                  readOnly: true),
                            ),
                      userNameController.text.isEmpty
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: RoundedButton(
                                Translations.of(context)!.search,
                                () {
                                  _getUser();
                                },
                                GeneralColor.appColor,
                                GeneralColor.white,
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: GeneralInputField(
                                      text: "اسم التاجر المحول له",
                                      controller: userNameController,
                                      textInputType: TextInputType.text,
                                      readOnly: true),
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: GeneralInputField(
                                      text: "اسم المحل",
                                      controller: shopNameController,
                                      textInputType: TextInputType.text,
                                      readOnly: true),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: GeneralInputField(
                                    text: Translations.of(context)!.amount,
                                    controller: valueController,
                                    textInputType: TextInputType.number,
                                    readOnly: false,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Text(
                                        Translations.of(context)!.creditType,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: FontSizeFile.s_size,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(2, 0, 2, 5),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: GeneralColor.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            width: 2,
                                            color: GeneralColor.appColor),
                                      ),
                                      child: Center(
                                        child: creditResponse == null
                                            ? const CircularProgressIndicator()
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: DropdownButton(
                                                    underline: const SizedBox(),
                                                    hint: Center(
                                                      child: Text(
                                                        dropDownType,
                                                        style: TextStyle(
                                                            color: GeneralColor
                                                                .black,
                                                            fontSize:
                                                                FontSizeFile
                                                                    .xs_size,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    isExpanded: true,
                                                    items: creditResponse!.data
                                                        .map((data) {
                                                      return DropdownMenuItem(
                                                        onTap: () {
                                                          setState(() {
                                                            dropDownType =
                                                                data.key;
                                                          });
                                                        },
                                                        child: Center(
                                                            child: Text(
                                                          data.key,
                                                        )),
                                                        value: data.value,
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        dropDownTypeId =
                                                            value.toString();
                                                      });
                                                    }),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: GeneralInputField(
                                    text: Translations.of(context)!.notes,
                                    controller: notesController,
                                    textInputType: TextInputType.text,
                                    readOnly: false,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                  child: RoundedButton(
                                    Translations.of(context)!.send,
                                    () {
                                      _validate();
                                    },
                                    GeneralColor.appColor,
                                    GeneralColor.white,
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  _validate() async {
    if (centerNumController.text.isEmpty ||
        userNameController.text.isEmpty ||
        valueController.text.isEmpty ||
        notesController.text.isEmpty ||
        dropDownTypeId.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      Progress.show(context);
      TransferBody transferBody = TransferBody(
          creditType: dropDownTypeId,
          creditProcessType: "0",
          userCode: centerNumController.text,
          amount: valueController.text,
          notes: notesController.text);
      try {
        http.Response response = await transferCreditApi(transferBody);
        int statusCode = response.statusCode;
        Progress.dismiss();
        if (statusCode == 200) {
          var parsed = json.decode(response.body);

          if (parsed["Code"] == 200) {
            UtilsFunctions.createToast(parsed["Message"]);
            Progress.dismiss();
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => Home(),
              ),
              (route) => false,
            );
          } else {
            UtilsFunctions.createToast(parsed["Message"]);
          }
        } else {
          UtilsFunctions.createToast(
              Translations.of(context)!.errorPleaseTryAgain);
        }
      } catch (ex) {
        Progress.dismiss();
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
      }
    }
  }

  _getUser() async {
    if (centerNumController.text.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      Progress.show(context);
      try {
        http.Response response =
        await getUserByCodeApi(centerNumController.text);
        int statusCode = response.statusCode;
        Progress.dismiss();
        if (statusCode == 200) {
          var parsed = json.decode(response.body);
          if (parsed["Code"] == 200) {
            setState(() {
              shopNameController.text = parsed["Data"]["ShopName"] ?? "-";
              userNameController.text = parsed["Data"]["UserName"] ?? "-";
            });
          } else {
            UtilsFunctions.createToast(parsed["Message"]);
          }
        } else {
          UtilsFunctions.createToast(
              Translations.of(context)!.errorPleaseTryAgain);
        }
      } catch (ex) {
        Progress.dismiss();
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
      }
    }
  }

}
