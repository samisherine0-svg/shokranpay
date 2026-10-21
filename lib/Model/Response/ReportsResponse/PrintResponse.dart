import 'dart:convert';
/// Data : {"Id":71,"TransactionId":90,"Amount":3600.0,"ServiceCost":0.0,"Commission":0.0,"RefNumber":"","PrintServiceDetailes":[{"Key":"المبلغ","Value":"3600","IsSeperator":false},{"Key":"رقم الموبايل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"قيدالفحص","UserCode":2,"FullName":"walid atia","PhoneNumber":"","ServiceName":"لحوم صدقات","DescriptionAr":"الاورمان","PoweredByAr":"CP","Date":"2022-12-14","Time":"15:37:11"}
/// Code : 200
/// Message : "عمليه ناجحه"

PrintResponse printResponseFromJson(String str) => PrintResponse.fromJson(json.decode(str));
String printResponseToJson(PrintResponse data) => json.encode(data.toJson());
class PrintResponse {
  PrintResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  PrintResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
PrintResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => PrintResponse(  data: data ?? _data,
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

/// Id : 71
/// TransactionId : 90
/// Amount : 3600.0
/// ServiceCost : 0.0
/// Commission : 0.0
/// RefNumber : ""
/// PrintServiceDetailes : [{"Key":"المبلغ","Value":"3600","IsSeperator":false},{"Key":"رقم الموبايل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}]
/// TransactionStatus : "قيدالفحص"
/// UserCode : 2
/// FullName : "walid atia"
/// PhoneNumber : ""
/// ServiceName : "لحوم صدقات"
/// DescriptionAr : "الاورمان"
/// PoweredByAr : "CP"
/// Date : "2022-12-14"
/// Time : "15:37:11"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? transactionId, 
      double? amount, 
      double? serviceCost, 
      double? commission, 
      String? refNumber, 
      List<PrintServiceDetailes>? printServiceDetailes, 
      String? transactionStatus, 
      int? userCode, 
      String? fullName, 
      String? phoneNumber, 
      String? serviceName, 
      String? descriptionAr, 
      String? poweredByAr, 
      String? date, 
      String? time,}){
    _id = id;
    _transactionId = transactionId;
    _amount = amount;
    _serviceCost = serviceCost;
    _commission = commission;
    _refNumber = refNumber;
    _printServiceDetailes = printServiceDetailes;
    _transactionStatus = transactionStatus;
    _userCode = userCode;
    _fullName = fullName;
    _phoneNumber = phoneNumber;
    _serviceName = serviceName;
    _descriptionAr = descriptionAr;
    _poweredByAr = poweredByAr;
    _date = date;
    _time = time;
}

  Data.fromJson(dynamic json) {
    _id = json['Id'];
    _transactionId = json['TransactionId'];
    _amount = json['Amount'];
    _serviceCost = json['ServiceCost'];
    _commission = json['Commission'];
    _refNumber = json['RefNumber'];
    if (json['PrintServiceDetailes'] != null) {
      _printServiceDetailes = [];
      json['PrintServiceDetailes'].forEach((v) {
        _printServiceDetailes?.add(PrintServiceDetailes.fromJson(v));
      });
    }
    _transactionStatus = json['TransactionStatus'];
    _userCode = json['UserCode'];
    _fullName = json['FullName'];
    _phoneNumber = json['PhoneNumber'];
    _serviceName = json['ServiceName'];
    _descriptionAr = json['DescriptionAr'];
    _poweredByAr = json['PoweredByAr'];
    _date = json['Date'];
    _time = json['Time'];
  }
  int? _id;
  int? _transactionId;
  double? _amount;
  double? _serviceCost;
  double? _commission;
  String? _refNumber;
  List<PrintServiceDetailes>? _printServiceDetailes;
  String? _transactionStatus;
  int? _userCode;
  String? _fullName;
  String? _phoneNumber;
  String? _serviceName;
  String? _descriptionAr;
  String? _poweredByAr;
  String? _date;
  String? _time;
Data copyWith({  int? id,
  int? transactionId,
  double? amount,
  double? serviceCost,
  double? commission,
  String? refNumber,
  List<PrintServiceDetailes>? printServiceDetailes,
  String? transactionStatus,
  int? userCode,
  String? fullName,
  String? phoneNumber,
  String? serviceName,
  String? descriptionAr,
  String? poweredByAr,
  String? date,
  String? time,
}) => Data(  id: id ?? _id,
  transactionId: transactionId ?? _transactionId,
  amount: amount ?? _amount,
  serviceCost: serviceCost ?? _serviceCost,
  commission: commission ?? _commission,
  refNumber: refNumber ?? _refNumber,
  printServiceDetailes: printServiceDetailes ?? _printServiceDetailes,
  transactionStatus: transactionStatus ?? _transactionStatus,
  userCode: userCode ?? _userCode,
  fullName: fullName ?? _fullName,
  phoneNumber: phoneNumber ?? _phoneNumber,
  serviceName: serviceName ?? _serviceName,
  descriptionAr: descriptionAr ?? _descriptionAr,
  poweredByAr: poweredByAr ?? _poweredByAr,
  date: date ?? _date,
  time: time ?? _time,
);
  int? get id => _id;
  int? get transactionId => _transactionId;
  double? get amount => _amount;
  double? get serviceCost => _serviceCost;
  double? get commission => _commission;
  String? get refNumber => _refNumber;
  List<PrintServiceDetailes>? get printServiceDetailes => _printServiceDetailes;
  String? get transactionStatus => _transactionStatus;
  int? get userCode => _userCode;
  String? get fullName => _fullName;
  String? get phoneNumber => _phoneNumber;
  String? get serviceName => _serviceName;
  String? get descriptionAr => _descriptionAr;
  String? get poweredByAr => _poweredByAr;
  String? get date => _date;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['TransactionId'] = _transactionId;
    map['Amount'] = _amount;
    map['ServiceCost'] = _serviceCost;
    map['Commission'] = _commission;
    map['RefNumber'] = _refNumber;
    if (_printServiceDetailes != null) {
      map['PrintServiceDetailes'] = _printServiceDetailes?.map((v) => v.toJson()).toList();
    }
    map['TransactionStatus'] = _transactionStatus;
    map['UserCode'] = _userCode;
    map['FullName'] = _fullName;
    map['PhoneNumber'] = _phoneNumber;
    map['ServiceName'] = _serviceName;
    map['DescriptionAr'] = _descriptionAr;
    map['PoweredByAr'] = _poweredByAr;
    map['Date'] = _date;
    map['Time'] = _time;
    return map;
  }

}

/// Key : "المبلغ"
/// Value : "3600"
/// IsSeperator : false

PrintServiceDetailes printServiceDetailesFromJson(String str) => PrintServiceDetailes.fromJson(json.decode(str));
String printServiceDetailesToJson(PrintServiceDetailes data) => json.encode(data.toJson());
class PrintServiceDetailes {
  PrintServiceDetailes({
      String? key, 
      String? value, 
      bool? isSeperator,}){
    _key = key;
    _value = value;
    _isSeperator = isSeperator;
}

  PrintServiceDetailes.fromJson(dynamic json) {
    _key = json['Key'];
    _value = json['Value'];
    _isSeperator = json['IsSeperator'];
  }
  String? _key;
  String? _value;
  bool? _isSeperator;
PrintServiceDetailes copyWith({  String? key,
  String? value,
  bool? isSeperator,
}) => PrintServiceDetailes(  key: key ?? _key,
  value: value ?? _value,
  isSeperator: isSeperator ?? _isSeperator,
);
  String? get key => _key;
  String? get value => _value;
  bool? get isSeperator => _isSeperator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Key'] = _key;
    map['Value'] = _value;
    map['IsSeperator'] = _isSeperator;
    return map;
  }

}