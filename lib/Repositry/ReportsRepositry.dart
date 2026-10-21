import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Model/Body/ReportsBody/BillsReportsBody.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/CreditMovementsReportBody.dart';
import 'package:pioneerspay/Model/Body/ReportsBody/PrintBody.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Body/ReportsBody/DailyCreditBody.dart';
import '../Model/Body/ReportsBody/DetailedReportBody.dart';

Future<http.Response> getBillsReportsApi(
    String version, BillsReportsBody billsReportsBody) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Reports/GetBills";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(billsReportsBody),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> getCreditMovementsReportApi(
    String version, CreditMovementsReportBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Reports/GetCreditMovementsReport";

    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> printApi(
    String version, PrintBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Transactions/Print";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> getPendingBillsApi() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Transactions/GetPending";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
Future<http.Response> getDailyCreditApi(
    DailyCreditBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Reports/GetDailyTransactions";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> getDetailedReportApi(
    DetailedReportBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version=   prefs.getString(Common.Version)??"V1";
    var url = "api/V1/Reports/GetTotalsByCategory";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

