import 'dart:convert';
/// Data : {"Amount":1347.47,"ServiceCost":134.747,"Commission":269.494,"PaymentBillInfo":"qTKtVXcXZA0=","BillDetailes":[{"Key":"نوع المركبة","Value":" كيــا","IsSeperator":false},{"Key":"الضرائب والرسوم","Value":" 1132.47","IsSeperator":false},{"Key":"تاريخ الانتهاء","Value":" 2023-07-07","IsSeperator":false},{"Key":"رقم الشاسية","Value":" 629270","IsSeperator":false},{"Key":"رقم الرخصة","Value":" 6759662","IsSeperator":false},{"Key":"موديل المركبة","Value":" سبورتاج","IsSeperator":false},{"Key":"رسوم تطوير","Value":" 105","IsSeperator":false},{"Key":"الاسم","Value":" طة السيد علي السيد","IsSeperator":false},{"Key":"عدد الركاب","Value":" 0","IsSeperator":false},{"Key":"وحدة المرور","Value":" وحده مرور الأميريه","IsSeperator":false},{"Key":"رقم اللوحة","Value":" أقج2368","IsSeperator":false},{"Key":"سعة الاسطوانة","Value":" 1591","IsSeperator":false},{"Key":"مبلغ التأمين","Value":" 110","IsSeperator":false},{"Key":"رقم الماتور","Value":" 970022","IsSeperator":false},{"Key":"ViolationStatus","Value":" 0","IsSeperator":false},{"Key":"VecLoad","Value":" 0","IsSeperator":false},{"Key":"امكانية التسليم بالمنزل","Value":" 1","IsSeperator":false},{"Key":"المحافظة","Value":" 1040","IsSeperator":false},{"Key":"نوع الترخيص","Value":" ملاكــــى","IsSeperator":false},{"Key":"تاريخ التصنيع","Value":" 2015","IsSeperator":false},{"Key":"TrafficBundle","Value":" false","IsSeperator":false}]}
/// Code : 200
/// Message : "عمليه ناجحه"

EnquiryResponse enquiryResponseFromJson(String str) => EnquiryResponse.fromJson(json.decode(str));
String enquiryResponseToJson(EnquiryResponse data) => json.encode(data.toJson());
class EnquiryResponse {
  EnquiryResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  EnquiryResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
EnquiryResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => EnquiryResponse(  data: data ?? _data,
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

/// Amount : 1347.47
/// ServiceCost : 134.747
/// Commission : 269.494
/// PaymentBillInfo : "qTKtVXcXZA0="
/// BillDetailes : [{"Key":"نوع المركبة","Value":" كيــا","IsSeperator":false},{"Key":"الضرائب والرسوم","Value":" 1132.47","IsSeperator":false},{"Key":"تاريخ الانتهاء","Value":" 2023-07-07","IsSeperator":false},{"Key":"رقم الشاسية","Value":" 629270","IsSeperator":false},{"Key":"رقم الرخصة","Value":" 6759662","IsSeperator":false},{"Key":"موديل المركبة","Value":" سبورتاج","IsSeperator":false},{"Key":"رسوم تطوير","Value":" 105","IsSeperator":false},{"Key":"الاسم","Value":" طة السيد علي السيد","IsSeperator":false},{"Key":"عدد الركاب","Value":" 0","IsSeperator":false},{"Key":"وحدة المرور","Value":" وحده مرور الأميريه","IsSeperator":false},{"Key":"رقم اللوحة","Value":" أقج2368","IsSeperator":false},{"Key":"سعة الاسطوانة","Value":" 1591","IsSeperator":false},{"Key":"مبلغ التأمين","Value":" 110","IsSeperator":false},{"Key":"رقم الماتور","Value":" 970022","IsSeperator":false},{"Key":"ViolationStatus","Value":" 0","IsSeperator":false},{"Key":"VecLoad","Value":" 0","IsSeperator":false},{"Key":"امكانية التسليم بالمنزل","Value":" 1","IsSeperator":false},{"Key":"المحافظة","Value":" 1040","IsSeperator":false},{"Key":"نوع الترخيص","Value":" ملاكــــى","IsSeperator":false},{"Key":"تاريخ التصنيع","Value":" 2015","IsSeperator":false},{"Key":"TrafficBundle","Value":" false","IsSeperator":false}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      double? amount, 
      double? serviceCost, 
      double? commission, 
      String? paymentBillInfo, 
      List<BillDetailes>? billDetailes,}){
    _amount = amount;
    _serviceCost = serviceCost;
    _commission = commission;
    _paymentBillInfo = paymentBillInfo;
    _billDetailes = billDetailes;
}

  Data.fromJson(dynamic json) {
    _amount = json['Amount'];
    _serviceCost = json['ServiceCost'];
    _commission = json['Commission'];
    _paymentBillInfo = json['PaymentBillInfo'];
    if (json['BillDetailes'] != null) {
      _billDetailes = [];
      json['BillDetailes'].forEach((v) {
        _billDetailes?.add(BillDetailes.fromJson(v));
      });
    }
  }
  double? _amount;
  double? _serviceCost;
  double? _commission;
  String? _paymentBillInfo;
  List<BillDetailes>? _billDetailes;
Data copyWith({  double? amount,
  double? serviceCost,
  double? commission,
  String? paymentBillInfo,
  List<BillDetailes>? billDetailes,
}) => Data(  amount: amount ?? _amount,
  serviceCost: serviceCost ?? _serviceCost,
  commission: commission ?? _commission,
  paymentBillInfo: paymentBillInfo ?? _paymentBillInfo,
  billDetailes: billDetailes ?? _billDetailes,
);
  double? get amount => _amount;
  double? get serviceCost => _serviceCost;
  double? get commission => _commission;
  String? get paymentBillInfo => _paymentBillInfo;
  List<BillDetailes>? get billDetailes => _billDetailes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = _amount;
    map['ServiceCost'] = _serviceCost;
    map['Commission'] = _commission;
    map['PaymentBillInfo'] = _paymentBillInfo;
    if (_billDetailes != null) {
      map['BillDetailes'] = _billDetailes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Key : "نوع المركبة"
/// Value : " كيــا"
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