import 'dart:convert';
/// Data : {"Date":"2022-12-21","Time":"11:23:41","TransactionNumber":"119","RefTransactionNumber":"","ApprovalNumber":"62","CardVM":{"Code":"70255890191682357","Serial":"55"},"PrintBill":{"Id":78,"TransactionId":119,"Amount":79.75,"ServiceCost":0.00,"Commission":0.00,"RefNumber":"","PrintServiceDetailes":[{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"الاسم","Value":"فاتورة: 2022-10","IsSeperator":false},{"Key":"الاستحقاق","Value":"2022-10","IsSeperator":false},{"Key":"الفئة","Value":"A2009608557","IsSeperator":false}],"TransactionStatus":"معلقه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"التليفون الارضى ","DescriptionAr":"telecom","PoweredByAr":"CP","Date":"2022-12-21","Time":"11:23:20"},"Amount":79.75,"ServiceCost":0.0,"Commission":0.0,"PaymentBillInfo":"1BEqrZjPV5A=","BalancePayable":false,"BillDetailes":[{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"الاسم","Value":"فاتورة: 2022-10","IsSeperator":false},{"Key":"الاستحقاق","Value":"2022-10","IsSeperator":false},{"Key":"الفئة","Value":"A2009608557","IsSeperator":false}]}
/// Code : 200
/// Message : "عمليه ناجحه"

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));
String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());
class PaymentResponse {
  PaymentResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  PaymentResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
PaymentResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => PaymentResponse(  data: data ?? _data,
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

/// Date : "2022-12-21"
/// Time : "11:23:41"
/// TransactionNumber : "119"
/// RefTransactionNumber : ""
/// ApprovalNumber : "62"
/// CardVM : {"Code":"70255890191682357","Serial":"55"}
/// PrintBill : {"Id":78,"TransactionId":119,"Amount":79.75,"ServiceCost":0.00,"Commission":0.00,"RefNumber":"","PrintServiceDetailes":[{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"الاسم","Value":"فاتورة: 2022-10","IsSeperator":false},{"Key":"الاستحقاق","Value":"2022-10","IsSeperator":false},{"Key":"الفئة","Value":"A2009608557","IsSeperator":false}],"TransactionStatus":"معلقه","UserCode":2,"FullName":"walid atia","PhoneNumber":null,"ServiceName":"التليفون الارضى ","DescriptionAr":"telecom","PoweredByAr":"CP","Date":"2022-12-21","Time":"11:23:20"}
/// Amount : 79.75
/// ServiceCost : 0.0
/// Commission : 0.0
/// PaymentBillInfo : "1BEqrZjPV5A="
/// BalancePayable : false
/// BillDetailes : [{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"الاسم","Value":"فاتورة: 2022-10","IsSeperator":false},{"Key":"الاستحقاق","Value":"2022-10","IsSeperator":false},{"Key":"الفئة","Value":"A2009608557","IsSeperator":false}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? date, 
      String? time, 
      String? transactionNumber, 
      String? refTransactionNumber, 
      String? approvalNumber, 
      CardVm? cardVM, 
      PrintBill? printBill, 
      double? amount, 
      double? serviceCost, 
      double? commission, 
      String? paymentBillInfo, 
      bool? balancePayable, 
      List<BillDetailes>? billDetailes,}){
    _date = date;
    _time = time;
    _transactionNumber = transactionNumber;
    _refTransactionNumber = refTransactionNumber;
    _approvalNumber = approvalNumber;
    _cardVM = cardVM;
    _printBill = printBill;
    _amount = amount;
    _serviceCost = serviceCost;
    _commission = commission;
    _paymentBillInfo = paymentBillInfo;
    _balancePayable = balancePayable;
    _billDetailes = billDetailes;
}

  Data.fromJson(dynamic json) {
    _date = json['Date'];
    _time = json['Time'];
    _transactionNumber = json['TransactionNumber'];
    _refTransactionNumber = json['RefTransactionNumber'];
    _approvalNumber = json['ApprovalNumber'];
    _cardVM = json['CardVM'] != null ? CardVm.fromJson(json['CardVM']) : null;
    _printBill = json['PrintBill'] != null ? PrintBill.fromJson(json['PrintBill']) : null;
    _amount = json['Amount'];
    _serviceCost = json['ServiceCost'];
    _commission = json['Commission'];
    _paymentBillInfo = json['PaymentBillInfo'];
    _balancePayable = json['BalancePayable'];
    if (json['BillDetailes'] != null) {
      _billDetailes = [];
      json['BillDetailes'].forEach((v) {
        _billDetailes?.add(BillDetailes.fromJson(v));
      });
    }
  }
  String? _date;
  String? _time;
  String? _transactionNumber;
  String? _refTransactionNumber;
  String? _approvalNumber;
  CardVm? _cardVM;
  PrintBill? _printBill;
  double? _amount;
  double? _serviceCost;
  double? _commission;
  String? _paymentBillInfo;
  bool? _balancePayable;
  List<BillDetailes>? _billDetailes;
Data copyWith({  String? date,
  String? time,
  String? transactionNumber,
  String? refTransactionNumber,
  String? approvalNumber,
  CardVm? cardVM,
  PrintBill? printBill,
  double? amount,
  double? serviceCost,
  double? commission,
  String? paymentBillInfo,
  bool? balancePayable,
  List<BillDetailes>? billDetailes,
}) => Data(  date: date ?? _date,
  time: time ?? _time,
  transactionNumber: transactionNumber ?? _transactionNumber,
  refTransactionNumber: refTransactionNumber ?? _refTransactionNumber,
  approvalNumber: approvalNumber ?? _approvalNumber,
  cardVM: cardVM ?? _cardVM,
  printBill: printBill ?? _printBill,
  amount: amount ?? _amount,
  serviceCost: serviceCost ?? _serviceCost,
  commission: commission ?? _commission,
  paymentBillInfo: paymentBillInfo ?? _paymentBillInfo,
  balancePayable: balancePayable ?? _balancePayable,
  billDetailes: billDetailes ?? _billDetailes,
);
  String? get date => _date;
  String? get time => _time;
  String? get transactionNumber => _transactionNumber;
  String? get refTransactionNumber => _refTransactionNumber;
  String? get approvalNumber => _approvalNumber;
  CardVm? get cardVM => _cardVM;
  PrintBill? get printBill => _printBill;
  double? get amount => _amount;
  double? get serviceCost => _serviceCost;
  double? get commission => _commission;
  String? get paymentBillInfo => _paymentBillInfo;
  bool? get balancePayable => _balancePayable;
  List<BillDetailes>? get billDetailes => _billDetailes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Date'] = _date;
    map['Time'] = _time;
    map['TransactionNumber'] = _transactionNumber;
    map['RefTransactionNumber'] = _refTransactionNumber;
    map['ApprovalNumber'] = _approvalNumber;
    if (_cardVM != null) {
      map['CardVM'] = _cardVM?.toJson();
    }
    if (_printBill != null) {
      map['PrintBill'] = _printBill?.toJson();
    }
    map['Amount'] = _amount;
    map['ServiceCost'] = _serviceCost;
    map['Commission'] = _commission;
    map['PaymentBillInfo'] = _paymentBillInfo;
    map['BalancePayable'] = _balancePayable;
    if (_billDetailes != null) {
      map['BillDetailes'] = _billDetailes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Key : "كود المحافظه"
/// Value : "048"
/// IsSeperator : false

BillDetailes billDetailesFromJson(String str) => BillDetailes.fromJson(json.decode(str));
String billDetailesToJson(BillDetailes data) => json.encode(data.toJson());
class BillDetailes {
  BillDetailes({
      String? key, 
      String? value, 
      bool? isSeperator,}){
    _key = key;
    _value = value;
    _isSeperator = isSeperator;
}

  BillDetailes.fromJson(dynamic json) {
    _key = json['Key'];
    _value = json['Value'];
    _isSeperator = json['IsSeperator'];
  }
  String? _key;
  String? _value;
  bool? _isSeperator;
BillDetailes copyWith({  String? key,
  String? value,
  bool? isSeperator,
}) => BillDetailes(  key: key ?? _key,
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

/// Id : 78
/// TransactionId : 119
/// Amount : 79.75
/// ServiceCost : 0.00
/// Commission : 0.00
/// RefNumber : ""
/// PrintServiceDetailes : [{"Key":"كود المحافظه","Value":"048","IsSeperator":false},{"Key":"رقم ارضى","Value":"2178310","IsSeperator":false},{"Key":"****","Value":"****","IsSeperator":true},{"Key":"الاسم","Value":"فاتورة: 2022-10","IsSeperator":false},{"Key":"الاستحقاق","Value":"2022-10","IsSeperator":false},{"Key":"الفئة","Value":"A2009608557","IsSeperator":false}]
/// TransactionStatus : "معلقه"
/// UserCode : 2
/// FullName : "walid atia"
/// PhoneNumber : null
/// ServiceName : "التليفون الارضى "
/// DescriptionAr : "telecom"
/// PoweredByAr : "CP"
/// Date : "2022-12-21"
/// Time : "11:23:20"

PrintBill printBillFromJson(String str) => PrintBill.fromJson(json.decode(str));
String printBillToJson(PrintBill data) => json.encode(data.toJson());
class PrintBill {
  PrintBill({
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

  PrintBill.fromJson(dynamic json) {
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
  dynamic _phoneNumber;
  String? _serviceName;
  String? _descriptionAr;
  String? _poweredByAr;
  String? _date;
  String? _time;
PrintBill copyWith({  int? id,
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
  String? descriptionAr,
  String? poweredByAr,
  String? date,
  String? time,
}) => PrintBill(  id: id ?? _id,
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
  dynamic get phoneNumber => _phoneNumber;
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

/// Code : "70255890191682357"
/// Serial : "55"

CardVm cardVmFromJson(String str) => CardVm.fromJson(json.decode(str));
String cardVmToJson(CardVm data) => json.encode(data.toJson());
class CardVm {
  CardVm({
      String? code, 
      String? serial,}){
    _code = code;
    _serial = serial;
}

  CardVm.fromJson(dynamic json) {
    _code = json['Code'];
    _serial = json['Serial'];
  }
  String? _code;
  String? _serial;
CardVm copyWith({  String? code,
  String? serial,
}) => CardVm(  code: code ?? _code,
  serial: serial ?? _serial,
);
  String? get code => _code;
  String? get serial => _serial;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['Serial'] = _serial;
    return map;
  }

}