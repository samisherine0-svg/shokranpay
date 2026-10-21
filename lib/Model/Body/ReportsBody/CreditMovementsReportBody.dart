// To parse this JSON data, do
//
//     final creditMovementsReportBody = creditMovementsReportBodyFromJson(jsonString);

import 'dart:convert';

CreditMovementsReportBody creditMovementsReportBodyFromJson(String str) => CreditMovementsReportBody.fromJson(json.decode(str));

String creditMovementsReportBodyToJson(CreditMovementsReportBody data) => json.encode(data.toJson());

class CreditMovementsReportBody {
  CreditMovementsReportBody({
    required this.dateFrom,
    required this.dateTo,
    required this.userCode,
    required this.creditType,
  });

  String dateFrom;
  String dateTo;
  String userCode;
  String creditType;

  factory CreditMovementsReportBody.fromJson(Map<String, dynamic> json) => CreditMovementsReportBody(
    dateFrom: json["DateFrom"],
    dateTo: json["DateTo"],
    userCode: json["UserCode"],
    creditType: json["CreditType"],
  );

  Map<String, dynamic> toJson() => {
    "DateFrom": dateFrom,
    "DateTo": dateTo,
    "UserCode": userCode,
    "CreditType": creditType,
  };
}
