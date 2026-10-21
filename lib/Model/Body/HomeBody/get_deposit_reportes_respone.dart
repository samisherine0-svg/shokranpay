// To parse this JSON data, do
//
//     final getDepositResponse = getDepositResponseFromJson(jsonString);

import 'dart:convert';

GetDepositResponse getDepositResponseFromJson(String str) => GetDepositResponse.fromJson(json.decode(str));

String getDepositResponseToJson(GetDepositResponse data) => json.encode(data.toJson());

class GetDepositResponse {
  GetDepositResponse({
    required this.data,
    required this.code,
    required this.message,
  });

  List<Datum> data;
  int code;
  String message;

  factory GetDepositResponse.fromJson(Map<String, dynamic> json) => GetDepositResponse(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    code: json["Code"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    "Code": code,
    "Message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.date,
    required this.time,
    required this.creditType,
    required this.clientName,
    required this.amount,
    required this.orderNo,
    required this.notes,
    required this.reason,
    required this.attachmentPath,
    required this.bankName,
    required this.status,
  });

  dynamic id;
  DateTime date;
  String time;
  String creditType;
  String clientName;
  dynamic amount;
  String orderNo;
  String notes;
  String reason;
  String attachmentPath;
  String bankName;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    date: DateTime.parse(json["Date"]),
    time: json["Time"],
    creditType: json["CreditType"],
    clientName: json["ClientName"],
    amount: json["Amount"],
    orderNo: json["OrderNo"],
    notes: json["Notes"],
    reason: json["Reason"],
    attachmentPath: json["AttachmentPath"],
    bankName: json["BankName"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "Time": time,
    "CreditType": creditType,
    "ClientName": clientName,
    "Amount": amount,
    "OrderNo": orderNo,
    "Notes": notes,
    "Reason": reason,
    "AttachmentPath": attachmentPath,
    "BankName": bankName,
    "Status": status,
  };
}
