import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pioneerspay/Cubit/SellersCubit/sellers_cubit.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Model/Body/SellersBody/CreateNewAgentUnderAgentBody.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/SellersServicesCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../Cubit/AuthorizationCubit/AuthCubit.dart';
import '../../../Provider/ProviderAccount.dart';
import '../../../Utils/FontSizeFile.dart';
import '../../Utils/NetworkErrorWidget.dart';
import '../../Utils/Progress.dart';
import '../../Utils/UtilsFunctions.dart';
import '../../Widgets/SellersServices/AddressSection.dart';
import '../../Widgets/SellersServices/PhotosSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewAgentUnderAgent extends StatefulWidget {
  CreateNewAgentUnderAgent();

  @override
  _CreateNewAgentUnderAgent createState() => _CreateNewAgentUnderAgent();
}

class _CreateNewAgentUnderAgent extends State<CreateNewAgentUnderAgent> {
  _CreateNewAgentUnderAgent();

  TextEditingController clientNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
            child: AppBarCustom("انشاء حساب جديد", () {
              Navigator.pop(context);
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  color: GeneralColor.white,
                  border: Border.all(width: 2, color: GeneralColor.appColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.firstName,
                        controller: firstNameController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.lastName,
                        controller: lastNameController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.userName,
                        controller: clientNameController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.email,
                        controller: emailController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.phoneNum,
                        controller: phoneNumberController,
                        textInputType: TextInputType.number,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.nationalID,
                        controller: nationalIDController,
                        textInputType: TextInputType.number,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.shopName,
                        controller: shopNameController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: Translations.of(context)!.password,
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    BlocProvider(
                      create: (context) => AuthCubit()..getAddress(context),
                      child: BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is AddressLoadState) {
                              return Container(
                                height: 30.0,
                                width: 30.0,
                                padding: const EdgeInsets.all(5.0),
                                child: const CircularProgressIndicator(),
                              );
                            } else if (state is AddressSuccessState) {
                              return AddressSection(state.data);
                            } else if (state is AddressErrorState) {
                              return NetworkErrorWidget();
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GeneralInputField(
                        text: "العنوان تفصيلي",
                        controller: addressController,
                        textInputType: TextInputType.text,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 5),
                      child: Text(
                        "${Translations.of(context)!.selectFiles}  (وجهي البطاقة الشخصية)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSizeFile.s_size,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    PhotosSection(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: RoundedButton(
                        Translations.of(context)!.send,
                        () {
                          _validate();
                        },
                        GeneralColor.appColor,
                        GeneralColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validate() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String userName = clientNameController.text;
    String email = emailController.text;
    String phone = phoneNumberController.text;
    String shopName = shopNameController.text;
    String nationalID = nationalIDController.text;
    String password = passwordController.text;
    String address = addressController.text;
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        userName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        shopName.isEmpty ||
        nationalID.isEmpty ||
        address.isEmpty ||
        password.isEmpty) {
      UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    } else {
      List<String>? list =
          Provider.of<ProviderAccount>(context, listen: false).getPhotos;
      int? villageID =
          Provider.of<ProviderAccount>(context, listen: false).getVillageID;
      print("ID" + villageID.toString());
      CreateNewAgentUnderAgentBody createNewAgentUnderAgentBody =
          CreateNewAgentUnderAgentBody(
              AppType: 2,
              email: email,
              Address: address,
              phoneNumber: phone,
              nationlID: nationalID,
              password: password,
              firstName: firstName,
              lastName: lastName,
              shopName: shopName,
              userName: userName,
              villageId: villageID);
      Progress.show(context);
      BlocProvider.of<SellersCubit>(context)
          .addAttachments(list!, createNewAgentUnderAgentBody, context);
    }
    //
    // String firstName = firstNameController.text;
    // String lastName = lastNameController.text;
    // String userName = clientNameController.text;
    // String email = emailController.text;
    // String phone = phoneNumberController.text;
    // String shopName = shopNameController.text;
    // String nationalID = nationalIDController.text;
    // String password = passwordController.text;
    // if (firstName.isEmpty ||
    //     lastName.isEmpty ||
    //     userName.isEmpty ||
    //     email.isEmpty ||
    //     phone.isEmpty ||
    //     shopName.isEmpty ||
    //     nationalID.isEmpty ||
    //     password.isEmpty) {
    //   UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
    // } else {
    //   int? villageID =
    //       Provider
    //           .of<ProviderAccount>(context, listen: false)
    //           .getVillageID;
    //   print("ID" + villageID.toString());
    //   CreateNewAgentUnderAgentBody createNewAgentUnderAgentBody =
    //   CreateNewAgentUnderAgentBody(
    //       email: email,
    //       phoneNumber: phone,
    //       nationlID: nationalID,
    //       password: password,
    //       firstName: firstName,
    //       lastName: lastName,
    //       shopName: shopName,
    //       userName: userName,
    //       villageId: villageID);
    //   Progress.show(context);
    //   BlocProvider.of<SellersCubit>(context)
    //       .createNewAgent(context, createNewAgentUnderAgentBody);
    // }
  }
}
