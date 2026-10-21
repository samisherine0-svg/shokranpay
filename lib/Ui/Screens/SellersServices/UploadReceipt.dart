import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UploadReceipt extends StatefulWidget {
  @override
  _UploadReceipt createState() => _UploadReceipt();
}

class _UploadReceipt extends State<UploadReceipt> {
  TextEditingController orderNumController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String receiptImage = "";
  XFile? imageFile;

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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SellersServicesCategory()));
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
                          Container(
                            width: screenWidth,
                            margin: const EdgeInsets.fromLTRB(2, 10, 2, 5),
                            child: Text(
                              Translations.of(context)!.bank,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSizeFile.s_size,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width:screenWidth,
                            height: 50,
                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: GeneralColor.white,
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  width: 2, color: GeneralColor.secondColor),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: GeneralInputField(
                                text: Translations.of(context)!.name,
                                controller: nameController,
                                textInputType: TextInputType.text, readOnly: false,),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: GeneralInputField(
                                text: Translations.of(context)!.orderNumber,
                                controller: orderNumController,
                                textInputType: TextInputType.number, readOnly: false,),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: GeneralInputField(
                                text: Translations.of(context)!.amount,
                                controller: valueController,
                                textInputType: TextInputType.number, readOnly: false,),
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
                            margin:
                            const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.fill,
                              height: 200,
                            ),
                          ),

                          // width: 200,
                          // height: 140,

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: RoundedButton(
                              Translations.of(context)!.uploadReceipt,
                                  () {
                                // _validate();
                              },
                              GeneralColor.appColor,
                              GeneralColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

    );
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

}
