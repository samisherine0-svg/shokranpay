import 'dart:convert';

/// UserName : "pio@pioneers-solutions"
/// Password : "asd123A@"
/// RememberMe : true

LoginBody loginBodyFromJson(String str) => LoginBody.fromJson(json.decode(str));

String loginBodyToJson(LoginBody data) => json.encode(data.toJson());

class LoginBody {
  LoginBody({
    String? userName,
    String? password,
    bool? rememberMe,
    String? AppId,
    String? OldSmsCode,
    String? IsConfirmationProcess,
    String? AppType,
    String? VersionID,
  }) {
    _userName = userName;
    _password = password;
    _rememberMe = rememberMe;
    _AppId = AppId;
    _OldSmsCode = OldSmsCode;
    _IsConfirmationProcess = IsConfirmationProcess;
    _AppType = AppType;
    _VersionID = VersionID;
  }

  LoginBody.fromJson(dynamic json) {
    _userName = json['UserName'];
    _password = json['Password'];
    _rememberMe = json['RememberMe'];
    _AppId = json['AppId'];
    _OldSmsCode = json['OldSmsCode'];
    _IsConfirmationProcess = json['IsConfirmationProcess'];
    _AppType = json['AppType'];
    _VersionID = json['VersionID'];
  }

  String? _userName;
  String? _password;
  bool? _rememberMe;
  String? _AppId;
  String? _OldSmsCode;
  String? _IsConfirmationProcess;
  String? _AppType;
  String? _VersionID;

  LoginBody copyWith({
    String? userName,
    String? password,
    bool? rememberMe,
    String? AppId,
    String? OldSmsCode,
    String? IsConfirmationProcess,
    String? AppType,
    String? VersionID,
  }) =>
      LoginBody(
        userName: userName ?? _userName,
        password: password ?? _password,
        rememberMe: rememberMe ?? _rememberMe,
        AppId: AppId ?? _AppId,
        OldSmsCode: OldSmsCode ?? _OldSmsCode,
        IsConfirmationProcess: IsConfirmationProcess ?? _IsConfirmationProcess,
        AppType: AppType ?? _AppType,
        VersionID: VersionID ?? _VersionID,
      );

  String? get userName => _userName;

  String? get password => _password;

  bool? get rememberMe => _rememberMe;

  String? get AppId => _AppId;

  String? get OldSmsCode => _OldSmsCode;

  String? get IsConfirmationProcess => _IsConfirmationProcess;
  String? get AppType => _AppType;
  String? get VersionID => _VersionID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserName'] = _userName;
    map['Password'] = _password;
    map['RememberMe'] = _rememberMe;
    map['AppId'] = _AppId;
    map['OldSmsCode'] = _OldSmsCode;
    map['IsConfirmationProcess'] = _IsConfirmationProcess;
    map['AppType'] = _AppType;
    map['VersionID'] = _VersionID;
    return map;
  }
}
