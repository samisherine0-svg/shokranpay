import 'dart:convert';
/// Fields : [{"Id":10,"Value":"29009150106695"},{"Id":11,"Value":"2368"},{"Id":12,"Value":"1"},{"Id":13,"Value":"01092257716"}]
/// CurrentServiceProviderId : 1
/// ServiceId : "2"

EnquiryBody EnquiryBodyFromJson(String str) => EnquiryBody.fromJson(json.decode(str));
String  EnquiryBodyToJson(EnquiryBody data) => json.encode(data.toJson());
class EnquiryBody {
  EnquiryBody({
      List<Fields>? fields, 
      int? currentServiceProviderId, 
      String? serviceId,}){
    _fields = fields;
    _currentServiceProviderId = currentServiceProviderId;
    _serviceId = serviceId;
}

  EnquiryBody.fromJson(dynamic json) {
    if (json['Fields'] != null) {
      _fields = [];
      json['Fields'].forEach((v) {
        _fields?.add(Fields.fromJson(v));
      });
    }
    _currentServiceProviderId = json['CurrentServiceProviderId'];
    _serviceId = json['ServiceId'];
  }
  List<Fields>? _fields;
  int? _currentServiceProviderId;
  String? _serviceId;
EnquiryBody copyWith({  List<Fields>? fields,
  int? currentServiceProviderId,
  String? serviceId,
}) => EnquiryBody(  fields: fields ?? _fields,
  currentServiceProviderId: currentServiceProviderId ?? _currentServiceProviderId,
  serviceId: serviceId ?? _serviceId,
);
  List<Fields>? get fields => _fields;
  int? get currentServiceProviderId => _currentServiceProviderId;
  String? get serviceId => _serviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fields != null) {
      map['Fields'] = _fields?.map((v) => v.toJson()).toList();
    }
    map['CurrentServiceProviderId'] = _currentServiceProviderId;
    map['ServiceId'] = _serviceId;
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