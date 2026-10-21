// To parse this JSON data, do
//
//     final getDepositBody = getDepositBodyFromJson(jsonString);

import 'dart:convert';

GetDepositBody getDepositBodyFromJson(String str) => GetDepositBody.fromJson(json.decode(str));

String getDepositBodyToJson(GetDepositBody data) => json.encode(data.toJson());

class GetDepositBody {
  GetDepositBody({
    required this.dateFrom,
    required this.dateTo,
    required this.depositStatus,
  });

  String dateFrom;
  String dateTo;
  int depositStatus;

  factory GetDepositBody.fromJson(Map<String, dynamic> json) => GetDepositBody(
    dateFrom: json["DateFrom"],
    dateTo: json["DateTo"],
    depositStatus: json["DepositStatus"],
  );

  Map<String, dynamic> toJson() => {
    "DateFrom": dateFrom,
    "DateTo": dateTo,
    "DepositStatus": depositStatus,
  };
}
