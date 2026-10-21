import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class Common {
  static const String LANGUAGE = 'language';
  static const String UserName = 'username';
  static const String AccessToken = 'token';
  static const String RefreshToken = 'refreshToken';
  static const String IpRecord = 'ipRecord';
  static const String ConfirmCode = 'printerType';
  static const String SendFireBaseToken = 'sendFireBaseToken';
  static const String FireBaseToken = 'fireBaseToken';
  static const String Password = 'password';
  static const String isSave = 'isSave';
  static const String LoginName = 'loginName';
  static const String CheckCloseApp = 'checkCloseApp';
  static const String CheckRememberPass = 'checkRememberPass';
  static const String isLogin = 'isLogin';
  static const String OldMessage = 'OldMessage';
  static const String PrinterType = 'printerType';
  static const String Version = 'version';
  static const String version = 'V20082026';

  static Future requestHeader() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptCharsetHeader: "charset=utf-8"
    };
    return headers;
  }

  static Future requestHeaderWithToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Bearer ${prefs.getString(Common.AccessToken) ?? ""}");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      "Authorization": "Bearer ${prefs.getString(Common.AccessToken) ?? ""}"
    };
    return headers;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Common.AccessToken, "");
    prefs.setString(Common.RefreshToken, "");
    prefs.setBool(Common.isLogin, false);
  }
}
