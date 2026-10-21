// To parse this JSON data, do
//
//     final transferBody = transferBodyFromJson(jsonString);

import 'dart:convert';

TransferBody transferBodyFromJson(String str) => TransferBody.fromJson(json.decode(str));

String transferBodyToJson(TransferBody data) => json.encode(data.toJson());

class TransferBody {
  TransferBody({
    required this.creditProcessType,
    required this.creditType,
    required this.userCode,
    required this.amount,
    required this.notes,
  });

  String creditProcessType;
  String creditType;
  String userCode;
  String amount;
  String notes;

  factory TransferBody.fromJson(Map<String, dynamic> json) => TransferBody(
    creditProcessType: json["CreditProcessType"],
    creditType: json["CreditType"],
    userCode: json["UserCode"],
    amount: json["Amount"],
    notes: json["Notes"],
  );

  Map<String, dynamic> toJson() => {
    "CreditProcessType": creditProcessType,
    "CreditType": creditType,
    "UserCode": userCode,
    "Amount": amount,
    "Notes": notes,
  };
}
