import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pioneerspay/Model/Body/AuthorizationBody/LoginBody.dart';
import 'package:pioneerspay/Model/Response/AuthorizationResponse/LoginResponse.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Body/AuthorizationBody/CreateNewAccountBody.dart';
import '../Model/Response/AuthorizationResponse/AddressResponse.dart';

Future<LoginResponse> loginApi(LoginBody loginBody) async {
  try {
    var header = await Common.requestHeader();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: "api/Account/Authenticate"),
      body: json.encode(loginBody),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      LoginResponse loginResponse =
          LoginResponse.fromJson(json.decode(response.body));

      return loginResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> createNewAccountApi(CreateNewAccountBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Agent/CreateNewAgent";
    var header = await Common.requestHeader();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      print("body" + body.toJson().toString());

      print("statusCode" + statusCode.toString());
      print("res" + response.body.toString());

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<AddressResponse> getAddressApi() async {
  try {
    var header = await Common.requestHeader();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: "api/V1/Address/GetData"),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      AddressResponse addressResponse =
          AddressResponse.fromJson(json.decode(response.body));

      return addressResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
Future<LoginResponse> resendCodeApi(LoginBody loginBody) async {
  try {
    var header = await Common.requestHeader();
    return http
        .post(
      Uri(
          scheme: "https",
          host: AppUrl.AppDomain,
          path: "api/Account/ResendConfirmationCode"),
      body: json.encode(loginBody),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      print(response.body.toString());
      LoginResponse loginResponse =
      LoginResponse.fromJson(json.decode(response.body));

      return loginResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<StreamedResponse> addAttachmentsApi(List<String> listImages) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri(
        scheme: "https",
        host: AppUrl.AppDomain,
        path: "api/V1/Attachment/Images/AddMultipleFile",
      ),
    );

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    request.headers.addAll(headers);

    if (listImages.isNotEmpty) {
      List<http.MultipartFile> newList = [];
      for (var img in listImages) {
        if (img != "") {
          var multipartFile = await http.MultipartFile.fromPath(
            "File",
            File(img).path,
            filename: img.split('/').last,
          );
          newList.add(multipartFile);
        }
      }

      request.files.addAll(newList);
    }
    var res = await request.send();
    print("res" + res.toString());
    return res;
  } catch (e) {
    throw new Exception("Error while fetching data");
  }
}
