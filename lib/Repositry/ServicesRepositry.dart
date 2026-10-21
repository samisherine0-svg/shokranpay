import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Model/Body/AuthorizationBody/LoginBody.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/EnquiryBody.dart';
import 'package:pioneerspay/Model/Body/ServicesBody/PaymentBody.dart';
import 'package:pioneerspay/Model/Response/AuthorizationResponse/LoginResponse.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/EnquiryResponse.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/PaymentResponse.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/ServicesListResponse.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ServicesListResponse> getServicesListApi() async {
  try {
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: "api/Services/GetServiceList"),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      print("statusCode" + statusCode.toString());
      print("res" + response.body.toString());

      ServicesListResponse servicesListResponse =
          ServicesListResponse.fromJson(json.decode(response.body));

      return servicesListResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> enquiryServicesApi(
    String version, EnquiryBody enquiryBody) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url ="api/V1/Transactions/Inquiry";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: url),
      body: json.encode(enquiryBody),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      // print("body" + enquiryBody.toJson().toString());
      //
      // print("statusCode" + statusCode.toString());
      // print("res" + response.body.toString());


      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> payServicesApi(
    String version, PaymentBody paymentBody) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url ="api/V1/Transactions/Payment";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: url),
      body: json.encode(paymentBody),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      // print("body" + paymentBody.toJson().toString());
      //
      // print("statusCode" + statusCode.toString());
      // print("res" + response.body.toString());



      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
