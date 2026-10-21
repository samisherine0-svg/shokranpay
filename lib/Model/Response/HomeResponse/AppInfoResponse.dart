import 'dart:convert';
/// Data : {"ID":1,"CompanyName":"Pioneers pay","Logo":"/Attachements/Logos/DefaultLogo.png","PhoneNumber":"01271870153","MobileNumber":"01271870153","Address":"شبين الكوم المنوفيه","Favicon":"/Attachements/Logos/favicon.ico","FacebookPage":"https://www.facebook.com/","WebSiteUrl":"http://localhost:13691/","TelegramPage":"https://web.telegram.org/k/","CallNumber":"01271870153","WhatsNumber":"01271870153"}
/// Code : 200
/// Message : "عمليه ناجحه"

AppInfoResponse appInfoResponseFromJson(String str) => AppInfoResponse.fromJson(json.decode(str));
String appInfoResponseToJson(AppInfoResponse data) => json.encode(data.toJson());
class AppInfoResponse {
  AppInfoResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  AppInfoResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
AppInfoResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => AppInfoResponse(  data: data ?? _data,
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

/// ID : 1
/// CompanyName : "Pioneers pay"
/// Logo : "/Attachements/Logos/DefaultLogo.png"
/// PhoneNumber : "01271870153"
/// MobileNumber : "01271870153"
/// Address : "شبين الكوم المنوفيه"
/// Favicon : "/Attachements/Logos/favicon.ico"
/// FacebookPage : "https://www.facebook.com/"
/// WebSiteUrl : "http://localhost:13691/"
/// TelegramPage : "https://web.telegram.org/k/"
/// CallNumber : "01271870153"
/// WhatsNumber : "01271870153"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? companyName, 
      String? logo, 
      String? phoneNumber, 
      String? mobileNumber, 
      String? address, 
      String? favicon, 
      String? facebookPage, 
      String? webSiteUrl, 
      String? telegramPage, 
      String? callNumber, 
      String? whatsNumber,}){
    _id = id;
    _companyName = companyName;
    _logo = logo;
    _phoneNumber = phoneNumber;
    _mobileNumber = mobileNumber;
    _address = address;
    _favicon = favicon;
    _facebookPage = facebookPage;
    _webSiteUrl = webSiteUrl;
    _telegramPage = telegramPage;
    _callNumber = callNumber;
    _whatsNumber = whatsNumber;
}

  Data.fromJson(dynamic json) {
    _id = json['ID'];
    _companyName = json['CompanyName'];
    _logo = json['Logo'];
    _phoneNumber = json['PhoneNumber'];
    _mobileNumber = json['MobileNumber'];
    _address = json['Address'];
    _favicon = json['Favicon'];
    _facebookPage = json['FacebookPage'];
    _webSiteUrl = json['WebSiteUrl'];
    _telegramPage = json['TelegramPage'];
    _callNumber = json['CallNumber'];
    _whatsNumber = json['WhatsNumber'];
  }
  int? _id;
  String? _companyName;
  String? _logo;
  String? _phoneNumber;
  String? _mobileNumber;
  String? _address;
  String? _favicon;
  String? _facebookPage;
  String? _webSiteUrl;
  String? _telegramPage;
  String? _callNumber;
  String? _whatsNumber;
Data copyWith({  int? id,
  String? companyName,
  String? logo,
  String? phoneNumber,
  String? mobileNumber,
  String? address,
  String? favicon,
  String? facebookPage,
  String? webSiteUrl,
  String? telegramPage,
  String? callNumber,
  String? whatsNumber,
}) => Data(  id: id ?? _id,
  companyName: companyName ?? _companyName,
  logo: logo ?? _logo,
  phoneNumber: phoneNumber ?? _phoneNumber,
  mobileNumber: mobileNumber ?? _mobileNumber,
  address: address ?? _address,
  favicon: favicon ?? _favicon,
  facebookPage: facebookPage ?? _facebookPage,
  webSiteUrl: webSiteUrl ?? _webSiteUrl,
  telegramPage: telegramPage ?? _telegramPage,
  callNumber: callNumber ?? _callNumber,
  whatsNumber: whatsNumber ?? _whatsNumber,
);
  int? get id => _id;
  String? get companyName => _companyName;
  String? get logo => _logo;
  String? get phoneNumber => _phoneNumber;
  String? get mobileNumber => _mobileNumber;
  String? get address => _address;
  String? get favicon => _favicon;
  String? get facebookPage => _facebookPage;
  String? get webSiteUrl => _webSiteUrl;
  String? get telegramPage => _telegramPage;
  String? get callNumber => _callNumber;
  String? get whatsNumber => _whatsNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = _id;
    map['CompanyName'] = _companyName;
    map['Logo'] = _logo;
    map['PhoneNumber'] = _phoneNumber;
    map['MobileNumber'] = _mobileNumber;
    map['Address'] = _address;
    map['Favicon'] = _favicon;
    map['FacebookPage'] = _facebookPage;
    map['WebSiteUrl'] = _webSiteUrl;
    map['TelegramPage'] = _telegramPage;
    map['CallNumber'] = _callNumber;
    map['WhatsNumber'] = _whatsNumber;
    return map;
  }

}