import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:http/http.dart' as http;

import '../../../../../Model/Body/SellersBody/AddMachineToResellerBody.dart';
import '../../../../../Model/Response/HomeResponse/InstallmentTypes.dart';
import '../../../../../Model/Response/HomeResponse/InstallmentTypes.dart'
    as installmentTypes;
import '../../../../../Model/Response/HomeResponse/MachineSerials.dart';
import '../../../../../Model/Response/HomeResponse/MachineTypes.dart';
import '../../../../../Repositry/HomeRepositry.dart';
import '../../../../../Repositry/SellersRepositry.dart';
import '../../../../Utils/Progress.dart';

class AddMachineToReseller extends StatefulWidget {
  final String userCode;
  final String userName;

  const AddMachineToReseller(
      {Key? key, required this.userCode, required this.userName})
      : super(key: key);

  @override
  _AddMachineToReseller createState() => _AddMachineToReseller();
}

class _AddMachineToReseller extends State<AddMachineToReseller> {
  TextEditingController centerNumController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  MachineTypes? machineTypes;
  MachineSerials? machineSerials;
  MachineTypes? machineInstallments;
  MachineInstallmentTypes? machineInstallmentTypes;
  String dropDownType = '';
  String dropDownTypeId = '';
  installmentTypes.Datum? dataShow;
  String dropDownMachineSerials = '';
  String dropDownMachineSerialsId = '';

  String dropDownMachineInstallment = '';
  String dropDownMachineInstallmentId = '';

  String dropDownMachineInstallmentType = '';
  String dropDownMachineInstallmentTypeId = '';

  bool loadingSerial = false;
  bool loadingInstallments = false;
  bool loadingInstallmentTypes = false;

  @override
  void initState() {
    super.initState();
    centerNumController.text = widget.userCode;
    userNameController.text = widget.userName;
    getMachineTypes();
  }

  getMachineTypes() {
    getMachineTypesApi().then((value) {
      setState(() {
        machineTypes = value;
      });
    }).catchError((onError) {
      getMachineTypes();
      print(onError);
    });
  }

  getMachineSerials(id) {
    setState(() {
      loadingSerial = true;
    });
    getMachineSerialsApi(id).then((value) {
      setState(() {
        machineSerials = value;
        loadingSerial = false;
      });
    }).catchError((onError) {
      getMachineSerials(id);
      print(onError);
    });
  }

  getMachineInstallments(id) {
    setState(() {
      loadingInstallments = true;
    });
    getMachineInstallmentsApi(id).then((value) {
      setState(() {
        machineInstallments = value;
        loadingInstallments = false;
      });
    }).catchError((onError) {
      getMachineInstallments(id);
      print(onError);
    });
  }

  getMachineInstallmentTypes(id) {
    setState(() {
      loadingInstallmentTypes = true;
    });
    getMachineInstallmentTypesApi(id).then((value) {
      setState(() {
        machineInstallmentTypes = value;
        loadingInstallmentTypes = false;
      });
    }).catchError((onError) {
      getMachineInstallmentTypes(id);
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
          child: AppBarCustom("تسليم المكينة للتاجر", () {
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
                                    Translations.of(context)!.merchantCode,
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
                                    border: Border.all(width: 2, color: GeneralColor.appColor),
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
                                  text: Translations.of(context)!.merchantCode,
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
                                      text: "اسم التاجر",
                                      controller: userNameController,
                                      textInputType: TextInputType.text,
                                      readOnly: true),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Text(
                                        Translations.of(context)!.machineType,
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
                                        borderRadius: BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 2, color: GeneralColor.appColor),
                                      ),
                                      child: Center(
                                        child: machineTypes == null
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
                                                    items: machineTypes!.data
                                                        .map((data) {
                                                      return DropdownMenuItem(
                                                        onTap: () {
                                                          setState(() {
                                                            dropDownType =
                                                                data.name;
                                                          });
                                                        },
                                                        child: Center(
                                                            child: Text(
                                                          data.name,
                                                        )),
                                                        value: data.id,
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        dropDownTypeId =
                                                            value.toString();
                                                        dropDownMachineSerials =
                                                            '';
                                                        dropDownMachineSerialsId =
                                                            '';

                                                        dropDownMachineInstallment =
                                                            '';
                                                        dropDownMachineInstallmentId =
                                                            '';

                                                        dropDownMachineInstallmentType =
                                                            '';
                                                        dropDownMachineInstallmentTypeId =
                                                            '';
                                                        machineSerials = null;
                                                        machineInstallments =
                                                            null;
                                                        machineInstallmentTypes =
                                                            null;
                                                        dataShow = null;
                                                        getMachineSerials(
                                                            dropDownTypeId);
                                                        getMachineInstallments(
                                                            dropDownTypeId);
                                                      });
                                                    }),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Text(
                                        Translations.of(context)!.machineSerial,
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
                                        borderRadius: BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 2, color: GeneralColor.appColor),
                                      ),
                                      child: Center(
                                        child: loadingSerial
                                            ? const CircularProgressIndicator()
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: machineSerials == null
                                                    ? const SizedBox()
                                                    : DropdownButton(
                                                        underline:
                                                            const SizedBox(),
                                                        hint: Center(
                                                          child: Text(
                                                            dropDownMachineSerials,
                                                            style: TextStyle(
                                                                color:
                                                                    GeneralColor
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
                                                        items: machineSerials!
                                                            .data
                                                            .map((data) {
                                                          return DropdownMenuItem(
                                                            onTap: () {
                                                              setState(() {
                                                                dropDownMachineSerials =
                                                                    data.serial;
                                                              });
                                                            },
                                                            child: Center(
                                                                child: Text(
                                                              data.serial,
                                                            )),
                                                            value: data.id,
                                                          );
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            dropDownMachineSerialsId =
                                                                value
                                                                    .toString();
                                                          });
                                                        }),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Text(
                                        "نوع التقسيط",
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
                                        borderRadius: BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 2, color: GeneralColor.appColor),
                                      ),
                                      child: Center(
                                        child: loadingInstallments
                                            ? const CircularProgressIndicator()
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: machineInstallments ==
                                                        null
                                                    ? const SizedBox()
                                                    : DropdownButton(
                                                        underline:
                                                            const SizedBox(),
                                                        hint: Center(
                                                          child: Text(
                                                            dropDownMachineInstallment,
                                                            style: TextStyle(
                                                                color:
                                                                    GeneralColor
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
                                                        items:
                                                            machineInstallments!
                                                                .data
                                                                .map((data) {
                                                          return DropdownMenuItem(
                                                            onTap: () {
                                                              setState(() {
                                                                dropDownMachineInstallment =
                                                                    data.name;
                                                              });
                                                            },
                                                            child: Center(
                                                                child: Text(
                                                              data.name,
                                                            )),
                                                            value: data.id,
                                                          );
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            dropDownMachineInstallmentId =
                                                                value
                                                                    .toString();
                                                            machineInstallmentTypes =
                                                                null;
                                                            dropDownMachineInstallmentTypeId =
                                                                "";
                                                            dropDownMachineInstallmentType =
                                                                "";
                                                            dataShow = null;
                                                            getMachineInstallmentTypes(
                                                                dropDownMachineInstallmentId);
                                                          });
                                                        }),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Text(
                                        "نظام التقسيط",
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
                                        borderRadius: BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 2, color: GeneralColor.appColor),
                                      ),
                                      child: Center(
                                        child: loadingInstallmentTypes
                                            ? const CircularProgressIndicator()
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: machineInstallmentTypes ==
                                                        null
                                                    ? const SizedBox()
                                                    : DropdownButton(
                                                        underline:
                                                            const SizedBox(),
                                                        hint: Center(
                                                          child: Text(
                                                            dropDownMachineInstallmentType,
                                                            style: TextStyle(
                                                                color:
                                                                    GeneralColor
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
                                                        items:
                                                            machineInstallmentTypes!
                                                                .data
                                                                .map((data) {
                                                          return DropdownMenuItem(
                                                            onTap: () {
                                                              setState(() {
                                                                dropDownMachineInstallmentType =
                                                                    data.name;
                                                                dataShow = installmentTypes.Datum(
                                                                    name: data
                                                                        .name,
                                                                    id: data.id,
                                                                    installmentsNumber:
                                                                        data
                                                                            .installmentsNumber,
                                                                    installmentValue:
                                                                        data
                                                                            .installmentValue,
                                                                    advance: data
                                                                        .advance);
                                                              });
                                                            },
                                                            child: Center(
                                                                child: Text(
                                                              data.name,
                                                            )),
                                                            value: data.id,
                                                          );
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            dropDownMachineInstallmentTypeId =
                                                                value
                                                                    .toString();
                                                          });
                                                        }),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                dataShow == null
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: size.width,
                                            child: Text(
                                              "نظام التقسيط   :    ${dataShow!.name}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: FontSizeFile.s_size,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                2, 0, 10, 5),
                                          ),
                                          Container(
                                            width: size.width,
                                            child: Text(
                                              "المقدم    :    ${dataShow!.advance}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: FontSizeFile.s_size,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                2, 0, 10, 5),
                                          ),
                                          Container(
                                            width: size.width,
                                            child: Text(
                                              "عدد الاقساط   :    ${dataShow!.installmentsNumber}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: FontSizeFile.s_size,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                2, 0, 10, 5),
                                          ),
                                          Container(
                                            width: size.width,
                                            child: Text(
                                              "قيمة القسط   :    ${dataShow!.installmentValue}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: FontSizeFile.s_size,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                2, 0, 10, 5),
                                          ),
                                        ],
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
        dropDownMachineInstallmentId.isEmpty ||
        dropDownMachineInstallmentTypeId.isEmpty ||
        dropDownMachineSerialsId.isEmpty ||
        dropDownTypeId.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      Progress.show(context);
      AddMachineToResellerBody transferBody = AddMachineToResellerBody(
        resellerCode: centerNumController.text,
        machineSerialId: dropDownMachineSerialsId,
        installmentTypeId: dropDownMachineInstallmentTypeId,
      );
      try {
        http.Response response = await addMachineToResellerApi(transferBody);
        int statusCode = response.statusCode;
        Progress.dismiss();
        if (statusCode == 200) {
          var parsed = json.decode(response.body);

          if (parsed["Code"] == 200) {
            UtilsFunctions.createToast(parsed["Message"]);
            Progress.dismiss();

            Navigator.pop(context);
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
              userNameController.text = parsed["Data"]["UserName"];
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
