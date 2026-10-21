import 'dart:convert';
/// DateFrom : "2022-12-14"
/// DateTo : "2022-12-15"

BillsReportsBody billsReportsBodyFromJson(String str) => BillsReportsBody.fromJson(json.decode(str));
String billsReportsBodyToJson(BillsReportsBody data) => json.encode(data.toJson());
class BillsReportsBody {
  BillsReportsBody({
      String? dateFrom, 
      String? dateTo,}){
    _dateFrom = dateFrom;
    _dateTo = dateTo;
}

  BillsReportsBody.fromJson(dynamic json) {
    _dateFrom = json['DateFrom'];
    _dateTo = json['DateTo'];
  }
  String? _dateFrom;
  String? _dateTo;
BillsReportsBody copyWith({  String? dateFrom,
  String? dateTo,
}) => BillsReportsBody(  dateFrom: dateFrom ?? _dateFrom,
  dateTo: dateTo ?? _dateTo,
);
  String? get dateFrom => _dateFrom;
  String? get dateTo => _dateTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DateFrom'] = _dateFrom;
    map['DateTo'] = _dateTo;
    return map;
  }

}