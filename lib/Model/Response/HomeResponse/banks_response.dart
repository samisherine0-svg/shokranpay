// To parse this JSON data, do
//
//     final banksResponse = banksResponseFromJson(jsonString);

import 'dart:convert';

BanksResponse banksResponseFromJson(String str) => BanksResponse.fromJson(json.decode(str));

String banksResponseToJson(BanksResponse data) => json.encode(data.toJson());

class BanksResponse {
  BanksResponse({
    required this.data,
    required this.code,
    required this.message,
  });

  List<Datum> data;
  int code;
  String message;

  factory BanksResponse.fromJson(Map<String, dynamic> json) => BanksResponse(
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
    required this.isActive,
    required this.IsPresentage,
    required this.bankName,
    required this.accountNumber,
    required this.TransferFees,
  });

  int id;
  bool isActive;
  bool IsPresentage;
  String bankName;
  String accountNumber;
  dynamic TransferFees;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    isActive: json["IsActive"],
    IsPresentage: json["IsPresentage"],
    bankName: json["BankName"],
    accountNumber: json["AccountNumber"],
    TransferFees: json["TransferFees"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "IsActive": isActive,
    "IsPresentage": IsPresentage,
    "BankName": bankName,
    "AccountNumber": accountNumber,
    "TransferFees": TransferFees,
  };
}
