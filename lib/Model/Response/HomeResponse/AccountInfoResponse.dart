import 'dart:convert';
/// Data : {"FirstName":"walid","LastName":"atia","UserName":"pio@pioneers-solutions","Email":"pio@pioneers-solutions","IsActive":true,"Role":"تاجر","PhoneNumber":"01271870159","UserCode":2,"ServiceCredit":23,"CashCredit":0}
/// Code : 200
/// Message : "عمليه ناجحه"

AccountInfoResponse accountInfoResponseFromJson(String str) => AccountInfoResponse.fromJson(json.decode(str));
String accountInfoResponseToJson(AccountInfoResponse data) => json.encode(data.toJson());
class AccountInfoResponse {
  AccountInfoResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  AccountInfoResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
AccountInfoResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => AccountInfoResponse(  data: data ?? _data,
  code: code ?? _code,
  message: message ?? _message,
);
  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['Code'] = _code;
    map['Message'] = _message;
    return map;
  }

}

/// FirstName : "walid"
/// LastName : "atia"
/// UserName : "pio@pioneers-solutions"
/// Email : "pio@pioneers-solutions"
/// IsActive : true
/// Role : "تاجر"
/// PhoneNumber : "01271870159"
/// UserCode : 2
/// ServiceCredit : 23
/// CashCredit : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? firstName, 
      String? lastName, 
      String? userName, 
      String? email, 
      bool? isActive, 
      String? role, 
      String? phoneNumber, 
      int? userCode, 
      double? serviceCredit,
    double? cashCredit,}){
    _firstName = firstName;
    _lastName = lastName;
    _userName = userName;
    _email = email;
    _isActive = isActive;
    _role = role;
    _phoneNumber = phoneNumber;
    _userCode = userCode;
    _serviceCredit = serviceCredit;
    _cashCredit = cashCredit;
}

  Data.fromJson(dynamic json) {
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _userName = json['UserName'];
    _email = json['Email'];
    _isActive = json['IsActive'];
    _role = json['Role'];
    _phoneNumber = json['PhoneNumber'];
    _userCode = json['UserCode'];
    _serviceCredit = json['ServiceCredit'];
    _cashCredit = json['CashCredit'];
  }
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? _email;
  bool? _isActive;
  String? _role;
  String? _phoneNumber;
  int? _userCode;
  double? _serviceCredit;
  double? _cashCredit;
Data copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  bool? isActive,
  String? role,
  String? phoneNumber,
  int? userCode,
  double? serviceCredit,
  double? cashCredit,
}) => Data(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  userName: userName ?? _userName,
  email: email ?? _email,
  isActive: isActive ?? _isActive,
  role: role ?? _role,
  phoneNumber: phoneNumber ?? _phoneNumber,
  userCode: userCode ?? _userCode,
  serviceCredit: serviceCredit ?? _serviceCredit,
  cashCredit: cashCredit ?? _cashCredit,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get userName => _userName;
  String? get email => _email;
  bool? get isActive => _isActive;
  String? get role => _role;
  String? get phoneNumber => _phoneNumber;
  int? get userCode => _userCode;
  double? get serviceCredit => _serviceCredit;
  double? get cashCredit => _cashCredit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['UserName'] = _userName;
    map['Email'] = _email;
    map['IsActive'] = _isActive;
    map['Role'] = _role;
    map['PhoneNumber'] = _phoneNumber;
    map['UserCode'] = _userCode;
    map['ServiceCredit'] = _serviceCredit;
    map['CashCredit'] = _cashCredit;
    return map;
  }

}