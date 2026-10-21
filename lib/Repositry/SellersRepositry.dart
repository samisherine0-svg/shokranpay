import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Body/SellersBody/CreateNewAgentUnderAgentBody.dart';
import '../Utils/AppUrl.dart';
import '../Utils/Common.dart';

Future<http.Response> createNewAgentApi(
    CreateNewAgentUnderAgentBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Agent/CreateNewAgentUnderAgent";
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
    print("e" + e.toString());

    throw Exception("Error while fetching data");
  }
}
