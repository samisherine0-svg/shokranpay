import 'dart:convert';
/// Data : {"ServiceCredit":23.0,"CashCredit":0.0}
/// Code : 200
/// Message : "عمليه ناجحه"

BalanceResponse balanceResponseFromJson(String str) => BalanceResponse.fromJson(json.decode(str));
String balanceResponseToJson(BalanceResponse data) => json.encode(data.toJson());
class BalanceResponse {
  BalanceResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  BalanceResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
BalanceResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => BalanceResponse(  data: data ?? _data,
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

/// ServiceCredit : 23.0
/// CashCredit : 0.0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      double? serviceCredit, 
      double? cashCredit,}){
    _serviceCredit = serviceCredit;
    _cashCredit = cashCredit;
}

  Data.fromJson(dynamic json) {
    _serviceCredit = json['ServiceCredit'];
    _cashCredit = json['CashCredit'];
  }
  double? _serviceCredit;
  double? _cashCredit;
Data copyWith({  double? serviceCredit,
  double? cashCredit,
}) => Data(  serviceCredit: serviceCredit ?? _serviceCredit,
  cashCredit: cashCredit ?? _cashCredit,
);
  double? get serviceCredit => _serviceCredit;
  double? get cashCredit => _cashCredit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ServiceCredit'] = _serviceCredit;
    map['CashCredit'] = _cashCredit;
    return map;
  }

}