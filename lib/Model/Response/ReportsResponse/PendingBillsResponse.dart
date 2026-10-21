import 'dart:convert';
/// Data : [{"Id":1012,"TransactionId":1019,"Amount":9.0,"ServiceCost":0.0,"Commission":0.0,"RefNumber":"","PrintServiceDetailes":[{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}],"TransactionStatus":"معلقه","UserCode":2,"FullName":"walid atia","PhoneNumber":"01271870159","ServiceName":"فواتير","Date":"2023-01-03","Time":"12:17:05","PrintWebTransactionId":"dYGeyUeJz+E=","ProviderName":"وي الانترنت المنزلي","CategoryName":"فواتير الانترنت"}]
/// Code : 200
/// Message : "عمليه ناجحه"

PendingBillsResponse pendingBillsResponseFromJson(String str) => PendingBillsResponse.fromJson(json.decode(str));
String pendingBillsResponseToJson(PendingBillsResponse data) => json.encode(data.toJson());
class PendingBillsResponse {
  PendingBillsResponse({
      List<Data>? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  PendingBillsResponse.fromJson(dynamic json) {
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
PendingBillsResponse copyWith({  List<Data>? data,
  int? code,
  String? message,
}) => PendingBillsResponse(  data: data ?? _data,
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

/// Id : 1012
/// TransactionId : 1019
/// Amount : 9.0
/// ServiceCost : 0.0
/// Commission : 0.0
/// RefNumber : ""
/// PrintServiceDetailes : [{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true}]
/// TransactionStatus : "معلقه"
/// UserCode : 2
/// FullName : "walid atia"
/// PhoneNumber : "01271870159"
/// ServiceName : "فواتير"
/// Date : "2023-01-03"
/// Time : "12:17:05"
/// PrintWebTransactionId : "dYGeyUeJz+E="
/// ProviderName : "وي الانترنت المنزلي"
/// CategoryName : "فواتير الانترنت"

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
      String? date, 
      String? time, 
      String? printWebTransactionId, 
      String? providerName, 
      String? categoryName,}){
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
    _printWebTransactionId = printWebTransactionId;
    _providerName = providerName;
    _categoryName = categoryName;
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
    _printWebTransactionId = json['PrintWebTransactionId'];
    _providerName = json['ProviderName'];
    _categoryName = json['CategoryName'];
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
  String? _date;
  String? _time;
  String? _printWebTransactionId;
  String? _providerName;
  String? _categoryName;
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
  String? date,
  String? time,
  String? printWebTransactionId,
  String? providerName,
  String? categoryName,
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
  printWebTransactionId: printWebTransactionId ?? _printWebTransactionId,
  providerName: providerName ?? _providerName,
  categoryName: categoryName ?? _categoryName,
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
  String? get date => _date;
  String? get time => _time;
  String? get printWebTransactionId => _printWebTransactionId;
  String? get providerName => _providerName;
  String? get categoryName => _categoryName;

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
    map['PrintWebTransactionId'] = _printWebTransactionId;
    map['ProviderName'] = _providerName;
    map['CategoryName'] = _categoryName;
    return map;
  }

}

/// Key : "كود المحافظه"
/// Value : "048"
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