import 'dart:convert';
/// Data : [{"Id":58,"TransactionId":73,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"رقم الكارت","Value":"2.500","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"10:56:44"},{"Id":59,"TransactionId":74,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"رقم الكارت","Value":"2.500","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"10:59:52"},{"Id":60,"TransactionId":75,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"رقم الكارت","Value":"2.500","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"11:33:28"},{"Id":61,"TransactionId":76,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"رقم الشركه","Value":"519","IsSeperator":false},{"Key":"رقم المشترك","Value":"7212306018700","IsSeperator":false},{"Key":"الموبيل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"التفاصيل","Value":"الأسم:احمد عبدالصمد الحاج\nرقم الفاتورة:65075\nالقيمة المستحقة:128.000\nالسنة:2022\nالشهر:12\n","IsSeperator":false}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"دفع فاتورة كهرباء جنوب الدلتا","Date":"2022-12-14","Time":"13:23:27"},{"Id":62,"TransactionId":77,"Amount":128,"ServiceCost":6.4,"Commission":12.8,"RefNumber":"380463078603","PrintServiceDetailes":[{"Key":"رقم الشركه","Value":"519","IsSeperator":false},{"Key":"رقم المشترك","Value":"7212306018700","IsSeperator":false},{"Key":"الموبيل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"التفاصيل","Value":"الأسم:احمد عبدالصمد الحاج\nرقم الفاتورة:65075\nالقيمة المستحقة:128.000\nالسنة:2022\nالشهر:12\n","IsSeperator":false}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"دفع فاتورة كهرباء جنوب الدلتا","Date":"2022-12-14","Time":"13:26:31"},{"Id":63,"TransactionId":78,"Amount":128,"ServiceCost":6.4,"Commission":12.8,"RefNumber":"380474140485","PrintServiceDetailes":[{"Key":"رقم المشترك","Value":"7212306018700","IsSeperator":false},{"Key":"الموبيل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"التفاصيل","Value":"الأسم:احمد عبدالصمد الحاج\nرقم الفاتورة:65075\nالقيمة المستحقة:128.000\nالسنة:2022\nالشهر:12\n","IsSeperator":false}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"دفع فاتورة كهرباء جنوب الدلتا","Date":"2022-12-14","Time":"13:38:29"},{"Id":64,"TransactionId":79,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"13:52:20"},{"Id":65,"TransactionId":80,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"14:02:05"},{"Id":66,"TransactionId":81,"Amount":2.5,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"كود الشحن","Value":"27744538260189055","IsSeperator":false},{"Key":"السريال","Value":"309782709","IsSeperator":false}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"فودافون - فكة - 2.5ج","Date":"2022-12-14","Time":"14:13:07"},{"Id":67,"TransactionId":82,"Amount":1,"ServiceCost":0,"Commission":0,"RefNumber":"","PrintServiceDetailes":[],"TransactionStatus":"قيدالفحص","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"PUBG Mobile UC 60 (EGY)","Date":"2022-12-14","Time":"14:43:21"},{"Id":68,"TransactionId":83,"Amount":30,"ServiceCost":0,"Commission":0,"RefNumber":"","PrintServiceDetailes":[],"TransactionStatus":"استعلام","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"PUBG Mobile UC 60 (EGY)","Date":"2022-12-14","Time":"14:45:58"},{"Id":69,"TransactionId":84,"Amount":30,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"PUBG Mobile UC 60 (EGY)","Date":"2022-12-14","Time":"14:53:46"},{"Id":70,"TransactionId":85,"Amount":30,"ServiceCost":0,"Commission":0,"RefNumber":"0","PrintServiceDetailes":[{"Key":"كود الشحن","Value":"xBWAeATbw58yKLQ0AbP3Vw","IsSeperator":false},{"Key":"السريال","Value":"6399c79e91df0","IsSeperator":false}],"TransactionStatus":"مدفوعه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"PUBG Mobile UC 60 (EGY)","Date":"2022-12-14","Time":"14:54:40"},{"Id":71,"TransactionId":90,"Amount":3600,"ServiceCost":0,"Commission":0,"RefNumber":"","PrintServiceDetailes":[{"Key":"المبلغ","Value":"3600","IsSeperator":false},{"Key":"رقم الموبايل","Value":"01271870153","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"قيدالفحص","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"لحوم صدقات","Date":"2022-12-14","Time":"15:37:11"}]
/// Code : 200
/// Message : "عمليه ناجحه"

BillsReportsResponse billsReportsResponseFromJson(String str) => BillsReportsResponse.fromJson(json.decode(str));
String billsReportsResponseToJson(BillsReportsResponse data) => json.encode(data.toJson());
class BillsReportsResponse {
  BillsReportsResponse({
      List<Data>? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  BillsReportsResponse.fromJson(dynamic json) {
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _code = json['Code'];
    _message = json['Message'];
  }
  List<Data>? _data;
  int? _code;
  String? _message;
BillsReportsResponse copyWith({  List<Data>? data,
  int? code,
  String? message,
}) => BillsReportsResponse(  data: data ?? _data,
  code: code ?? _code,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  int? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['Code'] = _code;
    map['Message'] = _message;
    return map;
  }

}

/// Id : 58
/// TransactionId : 73
/// Amount : 2.5
/// ServiceCost : 0
/// Commission : 0
/// RefNumber : "0"
/// PrintServiceDetailes : [{"Key":"رقم الكارت","Value":"2.500","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}]
/// TransactionStatus : "مدفوعه"
/// UserCode : 2
/// FullName : "walid atia"
/// PhoneNumber : null
/// ServiceName : "فودافون - فكة - 2.5ج"
/// Date : "2022-12-14"
/// Time : "10:56:44"

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
      dynamic phoneNumber, 
      String? serviceName, 
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
  dynamic _phoneNumber;
  String? _serviceName;
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
  dynamic phoneNumber,
  String? serviceName,
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
  dynamic get phoneNumber => _phoneNumber;
  String? get serviceName => _serviceName;
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
    map['Date'] = _date;
    map['Time'] = _time;
    return map;
  }

}

/// Key : "رقم الكارت"
/// Value : "2.500"
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