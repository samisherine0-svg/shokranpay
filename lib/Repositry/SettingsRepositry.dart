import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pioneerspay/Model/Body/SettingBody/ChangePasswordBody.dart';

import '../Utils/AppUrl.dart';
import '../Utils/Common.dart';

Future<http.Response> changePasswordsApi(
    ChangePasswordBody body) async {
  try {
    var url = "api/Account/ChangePassword";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
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
