import 'dart:convert';
/// Fields : [{"Id":10,"Value":"29009150106695"},{"Id":11,"Value":"2368"},{"Id":12,"Value":"1"},{"Id":13,"Value":"01092257716"}]
/// CurrentServiceProviderId : 1
/// ServiceId : "2"
/// PaymentBillInfo : "qTKtVXcXZA0="
/// Amount : 5

PaymentBody paymentBodyFromJson(String str) => PaymentBody.fromJson(json.decode(str));
String paymentBodyToJson(PaymentBody data) => json.encode(data.toJson());
class PaymentBody {
  PaymentBody({
      List<Fields>? fields, 
      int? currentServiceProviderId, 
      String? serviceId, 
      String? paymentBillInfo, 
      double? amount,}){
    _fields = fields;
    _currentServiceProviderId = currentServiceProviderId;
    _serviceId = serviceId;
    _paymentBillInfo = paymentBillInfo;
    _amount = amount;
}

  PaymentBody.fromJson(dynamic json) {
    if (json['Fields'] != null) {
      _fields = [];
      json['Fields'].forEach((v) {
        _fields?.add(Fields.fromJson(v));
      });
    }
    _currentServiceProviderId = json['CurrentServiceProviderId'];
    _serviceId = json['ServiceId'];
    _paymentBillInfo = json['PaymentBillInfo'];
    _amount = json['Amount'];
  }
  List<Fields>? _fields;
  int? _currentServiceProviderId;
  String? _serviceId;
  String? _paymentBillInfo;
  double? _amount;
PaymentBody copyWith({  List<Fields>? fields,
  int? currentServiceProviderId,
  String? serviceId,
  String? paymentBillInfo,
  double? amount,
}) => PaymentBody(  fields: fields ?? _fields,
  currentServiceProviderId: currentServiceProviderId ?? _currentServiceProviderId,
  serviceId: serviceId ?? _serviceId,
  paymentBillInfo: paymentBillInfo ?? _paymentBillInfo,
  amount: amount ?? _amount,
);
  List<Fields>? get fields => _fields;
  int? get currentServiceProviderId => _currentServiceProviderId;
  String? get serviceId => _serviceId;
  String? get paymentBillInfo => _paymentBillInfo;
  double? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fields != null) {
      map['Fields'] = _fields?.map((v) => v.toJson()).toList();
    }
    map['CurrentServiceProviderId'] = _currentServiceProviderId;
    map['ServiceId'] = _serviceId;
    map['PaymentBillInfo'] = _paymentBillInfo;
    map['Amount'] = _amount;
    return map;
  }

}

/// Id : 10
/// Value : "29009150106695"

Fields fieldsFromJson(String str) => Fields.fromJson(json.decode(str));
String fieldsToJson(Fields data) => json.encode(data.toJson());
class Fields {
  Fields({
      int? id, 
      String? value,}){
    _id = id;
    _value = value;
}

  Fields.fromJson(dynamic json) {
    _id = json['Id'];
    _value = json['Value'];
  }
  int? _id;
  String? _value;
Fields copyWith({  int? id,
  String? value,
}) => Fields(  id: id ?? _id,
  value: value ?? _value,
);
  int? get id => _id;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Value'] = _value;
    return map;
  }

}