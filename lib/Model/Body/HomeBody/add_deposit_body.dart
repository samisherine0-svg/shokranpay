// To parse this JSON data, do
//
//     final addDepositBody = addDepositBodyFromJson(jsonString);

import 'dart:convert';

AddDepositBody addDepositBodyFromJson(String str) => AddDepositBody.fromJson(json.decode(str));

String addDepositBodyToJson(AddDepositBody data) => json.encode(data.toJson());

class AddDepositBody {
  AddDepositBody({
     this.creditType,
     this.clientName,
     this.amount,
     this.orderNo,
     this.notes,
     this.attachmentId,
     this.bankId,
  });

  dynamic creditType;
  dynamic clientName;
  dynamic amount;
  dynamic orderNo;
  dynamic notes;
  dynamic attachmentId;
  dynamic bankId;

  factory AddDepositBody.fromJson(Map<String, dynamic> json) => AddDepositBody(
    creditType: json["CreditType"],
    clientName: json["ClientName"],
    amount: json["Amount"],
    orderNo: json["OrderNo"],
    notes: json["Notes"],
    attachmentId: json["AttachmentId"],
    bankId: json["BankId"],
  );

  Map<String, dynamic> toJson() => {
    "CreditType": creditType,
    "ClientName": clientName,
    "Amount": amount,
    "OrderNo": orderNo,
    "Notes": notes,
    "AttachmentId": attachmentId,
    "BankId": bankId,
  };
}
