import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/PaymentBody.dart';
import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/EnquiryResponse.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/EnquiryBody.dart' as c1;
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Screens/Services/PaymentDetails.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Widgets/Services/DetailsPayTile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/PaymentResponse.dart'
    as c2;

class ServicesPayment extends StatefulWidget {
  String serviceID;
  String serviceName;
  Data data;
  List<c1.Fields> fields;
  int? currentServiceProviderId;
  int paymentType;

  ServicesPayment(this.serviceID, this.serviceName, this.data, this.fields,
      this.currentServiceProviderId, this.paymentType);

  @override
  _ServicesPayment createState() => _ServicesPayment(serviceID, serviceName,
      data, fields, currentServiceProviderId, paymentType);
}

class _ServicesPayment extends State<ServicesPayment> {
  String serviceID;
  String serviceName;
  Data data;
  bool enabled = true;
  List<c1.Fields> fields;
  int? currentServiceProviderId;
  int paymentType;


  _ServicesPayment(this.serviceID, this.serviceName, this.data, this.fields,
      this.currentServiceProviderId, this.paymentType);

  @override
  Widget build(BuildContext context) {
    List<DetailsPayModel> list = getListDetailsPay();
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) =>
                              DetailsPayTile(list[index]),
                        ),
                      ),
                      paymentType == 1
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: 50,
                                      width: (screenWidth / 2) - 40,
                                      decoration: BoxDecoration(
                                        color: GeneralColor.appColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            validate(data.amount.toString());
                                          },
                                          child: Center(
                                            child: Text(
                                                Translations.of(context)!.pay,
                                                style: TextStyle(
                                                  color: GeneralColor.white,
                                                  fontSize:
                                                      FontSizeFile.xs_size,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 50,
                                      width: (screenWidth / 2) - 40,
                                      decoration: BoxDecoration(
                                        color: GeneralColor.wGrey,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            _showDialogUpdate(context);
                                          },
                                          child: Center(
                                            child: Text(
                                                Translations.of(context)!
                                                    .update,
                                                style: TextStyle(
                                                  color: GeneralColor.appColor,
                                                  fontSize:
                                                      FontSizeFile.xs_size,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                              child: AbsorbPointer(
                                absorbing: !enabled,
                                child: RoundedButton(
                                  Translations.of(context)!.pay,
                                  () {
                                    setState(() {
                                      enabled = false;
                                    });
                                    validate(data.amount.toString());
                                  },
                                  GeneralColor.appColor,
                                  GeneralColor.white,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DetailsPayModel> getListDetailsPay() {
    List<DetailsPayModel> list = [];

    double total = data.amount! + data.serviceCost!;
    if (data.billDetailes != null) {
      for (int i = 0; i < data.billDetailes!.length; i++) {
        if (!data.billDetailes!.elementAt(i).isSeperator!) {
          DetailsPayModel detailsPayModel = DetailsPayModel(
              key: data.billDetailes!.elementAt(i).key,
              value: data.billDetailes!.elementAt(i).value);
          list.add(detailsPayModel);
        }
      }
    }
    DetailsPayModel detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.amount, value: data.amount.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.serviceCost,
        value: data.serviceCost.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.commission,
        value: data.commission.toString());
    list.add(detailsPayModel);
    detailsPayModel = DetailsPayModel(
        key: Translations.of(context)!.totalAmount, value: total.toString());
    list.add(detailsPayModel);

    return list;
  }

  validate(String amount) {
    List<Fields> listNewFiled = [];
    for (int i = 0; i < fields.length; i++) {
      listNewFiled.add(Fields(id: fields[i].id, value: fields[i].value));
    }
    PaymentBody paymentBody = PaymentBody(
        amount: double.parse(amount),
        serviceId: serviceID,
        currentServiceProviderId: currentServiceProviderId,
        fields: listNewFiled,
        paymentBillInfo: data.paymentBillInfo);

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => PaymentDetails(
    //             serviceID, serviceName, c2.PaymentResponse(code: 200,message: "",data: c2.Data()))));
    Progress.show(context);
    BlocProvider.of<ServicesCubit>(context)
        .payServices(context, "V1", paymentBody, serviceID, serviceName);
  }

  _showDialogUpdate(BuildContext context2) {
    TextEditingController newValueController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                          text: Translations.of(context2)!.amount,
                          controller: newValueController,
                          textInputType: TextInputType.number, readOnly: false,),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: AbsorbPointer(
                        absorbing: !enabled,
                        child: RoundedButton(
                          Translations.of(context2)!.pay,
                          () {
                            setState(() {
                              enabled = false;
                            });
                            Navigator.pop(context);
                            validate(newValueController.text);
                          },
                          GeneralColor.appColor,
                          GeneralColor.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
