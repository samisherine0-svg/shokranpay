import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Repositry/HomeRepositry.dart';
import 'package:pioneerspay/Ui/Widgets/SellersServices/PhotosSection.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:provider/provider.dart';

import '../../../../Cubit/DepositCubit/deposit_cubit.dart';
import '../../../../Model/Body/HomeBody/add_deposit_body.dart';
import '../../../../Model/Response/AuthorizationResponse/AttachmentsResponse.dart';
import '../../../../Model/Response/HomeResponse/banks_response.dart';
import '../../../../Model/Response/HomeResponse/credit_response.dart';
import '../../../../Provider/ProviderAccount.dart';
import '../../../../Repositry/AuthorizationRepositry.dart';
import '../../../../Utils/Common.dart';
import '../../../../Utils/FontSizeFile.dart';
import '../../../Utils/AppBarCustom.dart';
import '../../../Utils/GeneralInputField.dart';
import '../../../Utils/Progress.dart';
import '../../../Utils/RoundedButton.dart';

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/UtilsFunctions.dart';
import '../../Authoriation/Login.dart';


class UploadReceipt extends StatefulWidget {
  @override
  _UploadReceipt createState() => _UploadReceipt();
}

class _UploadReceipt extends State<UploadReceipt> {
  TextEditingController amountController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bankAccount = TextEditingController();
  TextEditingController bankAccountFees = TextEditingController();
  String receiptImage = "";
  String dropDownBankId = "";
  String dropDownBank = "";
  XFile? imageFile;
  BanksResponse? banksResponse;

  String dropDownDeposit = "";
  String dropDownDepositId = "";
  CreditResponse? creditResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredit();
    getBanks();
  }

  getBanks() {
    getBanksApi().then((value) {
      setState(() {
        banksResponse = value;
      });
    }).catchError((onError) {
      getBanks();
      print(onError);
    });
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
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: GeneralColor.wGrey,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
              child: AppBarCustom(Translations.of(context)!.uploadReceipt, () {
                Navigator.pop(context);
              }),
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: screenWidth,
                              child: Text(
                                Translations.of(context)!.bank,
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
                                child: banksResponse == null
                                    ? const CircularProgressIndicator()
                                    : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton(
                                      underline: const SizedBox(),
                                      hint: Center(
                                        child: Text(
                                          dropDownBank,
                                          style: TextStyle(
                                              color: GeneralColor.black,
                                              fontSize:
                                              FontSizeFile.xs_size,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ),
                                      isExpanded: true,
                                      items:
                                      banksResponse!.data.map((data) {
                                        return DropdownMenuItem(
                                          onTap: () {
                                            setState(() {
                                              dropDownBank =
                                                  data.bankName;

                                              bankAccount.text = data
                                                  .accountNumber
                                                  .toString();
                                              bankAccountFees.text = data.IsPresentage ?"% ${data.TransferFees.toString()} ": data.TransferFees.toString();
                                            });
                                          },
                                          child: Center(
                                              child: Text(
                                                data.bankName,
                                              )),
                                          value: data.id,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          dropDownBankId =
                                              value.toString();
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        bankAccount.text.isEmpty
                            ? SizedBox()
                            : Column(
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: GeneralInputField(
                                text: "رقم الحساب",
                                controller: bankAccount,
                                textInputType: TextInputType.text,
                                readOnly: true,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0, 10, 0, 10),
                              child: GeneralInputField(
                                text: "رسوم الايداع",
                                controller: bankAccountFees,
                                textInputType: TextInputType.text,
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: screenWidth,
                              child: Text(
                                Translations.of(context)!.creditType,
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
                                child: creditResponse == null
                                    ? const CircularProgressIndicator()
                                    : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton(
                                      underline: const SizedBox(),
                                      hint: Center(
                                        child: Text(
                                          dropDownDeposit,
                                          style: TextStyle(
                                              color: GeneralColor.black,
                                              fontSize:
                                              FontSizeFile.xs_size,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ),
                                      isExpanded: true,
                                      items: creditResponse!.data
                                          .map((data) {
                                        return DropdownMenuItem(
                                          onTap: () {
                                            setState(() {
                                              dropDownDeposit = data.key;
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
                                          dropDownDepositId =
                                              value.toString();
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                            text: Translations.of(context)!.name,
                            controller: nameController,
                            textInputType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                              text: Translations.of(context)!.amount,
                              controller: amountController,
                              textInputType: TextInputType.number),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                            text: Translations.of(context)!.orderNumber2,
                            controller: numberController,
                            textInputType: TextInputType.number,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GeneralInputField(
                            text: Translations.of(context)!.notes,
                            controller: notesController,
                            textInputType: TextInputType.text,
                          ),
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Translations.of(context)!.uploadRec,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSizeFile.s_size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(
                                'assets/images/add_image.png',
                                width: 25,
                                height: 25,
                              ),
                            ],
                          ),
                          onTap: () {
                            pickImageFromGallery(ImageSource.gallery);
                          },
                        ),
                        imageFile == null
                            ? Container()
                            : Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Image.file(
                            File(imageFile!.path),
                            fit: BoxFit.fill,
                            height: 200,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: RoundedButton(
                            Translations.of(context)!.add,
                                () {
                              validate(context);
                            },
                            GeneralColor.appColor,
                            GeneralColor.white,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  pickImageFromGallery(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile!;
    });
    _getBase64(pickedFile!.path);
  }

  _getBase64(String imagePath) async {
    File imagefile = File(imagePath);
    Uint8List imagebytes = await imagefile.readAsBytes();

    setState(() {
      receiptImage = base64.encode(imagebytes);
    });
  }

  addDeposit(BuildContext context, AddDepositBody body) async {
    try {
      http.Response response = await addDepositApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      print("Statsu $statusCode");
      if (statusCode == 200) {
        // CreateNewAgentUnderAgentResponse res =
        //     CreateNewAgentUnderAgentResponse.fromJson(
        //         json.decode(response.body));
        Map res = json.decode(response.body);
        if (res["Code"] == 200) {
          UtilsFunctions.createToast(res["Message"]);
          Navigator.pop(context);
        } else {
          UtilsFunctions.createToast(res["Message"]);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
      }
    } catch (ex) {
      Progress.dismiss();
      UtilsFunctions.createToast(ex.toString());
    }
  }

  validate(context) {
    List<String>? list = [imageFile!.path];
    String name = nameController.text;
    String amount = amountController.text;
    String orderNo = numberController.text;
    String notes = notesController.text.isEmpty ? "-" : notesController.text;
    if (name.isEmpty ||
        amount.isEmpty ||
        orderNo.isEmpty ||
        dropDownDepositId.isEmpty ||
        dropDownBankId.isEmpty ||
        list.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      AddDepositBody addDepositBody = AddDepositBody(
        clientName: name,
        bankId: dropDownBankId,
        creditType: dropDownDepositId,
        amount: amount,
        notes: notes,
        orderNo: orderNo,
      );
      if (list == null) {
        UtilsFunctions.createToast(Translations.of(context)!.selectFiles);
      } else {
        Progress.show(context);
        addAttachments(list, addDepositBody, context);
      }
    }
  }

  addAttachments(List<String> listImages, AddDepositBody addDepositBody,
      BuildContext context) async {
    try {
      var response = await addAttachmentsApi(listImages);
      String body = await response.stream.bytesToString();
      // print("res" + body.toString());

      AttachmentsResponse attachmentsResponse =
      AttachmentsResponse.fromJson(json.decode(body));
      if (attachmentsResponse.code == 200) {
        print(attachmentsResponse.data);
        addDepositBody.attachmentId = attachmentsResponse.data![0].toString();
        addDeposit(context, addDepositBody);
      } else {
        Progress.dismiss();
        UtilsFunctions.createToast(attachmentsResponse.message!);
      }
    } catch (e) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }
}

