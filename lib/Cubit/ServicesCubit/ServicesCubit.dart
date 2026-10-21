import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:pioneerspay/Datebase/DatebaseRepositry.dart';
import 'package:pioneerspay/Datebase/Entity/Parameter.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/EnquiryBody.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/PaymentBody.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/PaymentResponse.dart';
import 'package:pioneerspay/Ui/Screens/Services/ServicesEnquiry.dart';
import 'package:pioneerspay/Ui/Screens/Services/ServicesPayment.dart';
import 'package:pioneerspay/Ui/Screens/Services/PaymentDetails.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/EnquiryResponse.dart';

import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pioneerspay/Repositry/ServicesRepositry.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:http/http.dart' as http;

part 'ServicesState.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(InitialServicesState());

  static ServicesCubit get(context) => BlocProvider.of(context);

  getLocalProviders(String serviceID, BuildContext context) async {
    try {
      var response = await DataBaseRepositry.getProviders(serviceID);
      emit(ProvidersSuccessState(response));
    } catch (ex) {
      emit(ErrorState(ex.toString()));
    }
  }

  getLocalServices(String providerID, BuildContext context) async {
    try {
      var response = await DataBaseRepositry.getServices(providerID);
      emit(ServicesSuccessState(response));
    } catch (ex) {
      emit(ErrorState(ex.toString()));
    }
  }

  getLocalParameters(String serviceID, BuildContext context) async {
    try {
      var response = await DataBaseRepositry.getParameters(serviceID);
      emit(ParameterSuccessState(response));
    } catch (ex) {
      emit(ErrorState(ex.toString()));
    }
  }

  enquiryServices(BuildContext context, String version, EnquiryBody enquiryBody,
      String serviceID, String serviceName, int paymentType) async {
    try {
      http.Response response = await enquiryServicesApi(version, enquiryBody);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        EnquiryResponse enquiryResponse =
            EnquiryResponse.fromJson(json.decode(response.body));
        if (enquiryResponse.code == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServicesPayment(
                      serviceID,
                      serviceName,
                      enquiryResponse.data!,
                      enquiryBody.fields!,
                      enquiryBody.currentServiceProviderId,
                      paymentType)));
        } else {
          UtilsFunctions.createToast(enquiryResponse.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(statusCode.toString());
      }
    } catch (e) {
      UtilsFunctions.createToast(e.toString());
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  payServices(BuildContext context, String version, PaymentBody paymentBody,
      String serviceID, String serviceName) async {
    try {
      http.Response response = await payServicesApi(version, paymentBody);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        print("Enter");
        PaymentResponse paymentResponse =
            PaymentResponse.fromJson(json.decode(response.body));
        if (paymentResponse.code == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentDetails(
                      serviceID, serviceName, paymentResponse.data!)));
        } else {
          UtilsFunctions.createToast(paymentResponse.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(statusCode.toString());
      }
    } catch (e) {
      print("e" + e.toString());
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  checkDirectPay(
      String serviceID,
      String serviceName,
      String currentProviderID,
      String providerID,
      String providerName,
      String categoryID,
      String categoryName,
      int paymentType,
      BuildContext context) async {
    try {
      var response = await DataBaseRepositry.getParameters(serviceID);
      if (response.isNotEmpty) {

      } else {
        EnquiryBody enquiryBody = EnquiryBody(
            fields: [],
            currentServiceProviderId: int.parse(currentProviderID),
            serviceId: serviceID);
        Progress.show(context);
        BlocProvider.of<ServicesCubit>(context).enquiryServices(
            context, "V1", enquiryBody, serviceID, serviceName, paymentType);
      }
    } catch (ex) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  // getContacts() async {
  //   try {
  //     emit(LoadState());
  //     if (await FlutterContacts.requestPermission()) {
  //       List<Contact> contacts = await FlutterContacts.getContacts(
  //           withProperties: true, withPhoto: true);
  //       print(contacts);
  //       emit(ContactsSuccessState(contacts));
  //     } else {
  //       emit(ErrorState("Take permission"));
  //     }
  //   } catch (ex) {
  //     emit(ErrorState(ex.toString()));
  //   }
  // }
}
