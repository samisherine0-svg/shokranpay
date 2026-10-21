// To parse this JSON data, do
//
//     final merchantListResponse = merchantListResponseFromJson(jsonString);

import 'dart:convert';

MerchantListResponse merchantListResponseFromJson(String str) => MerchantListResponse.fromJson(json.decode(str));

String merchantListResponseToJson(MerchantListResponse data) => json.encode(data.toJson());

class MerchantListResponse {
  MerchantListResponse({
    required this.data,
    required this.code,
    required this.message,
  });

  List<Datum> data;
  int code;
  String message;

  factory MerchantListResponse.fromJson(Map<String, dynamic> json) => MerchantListResponse(
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
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.isActive,
    required this.role,
    this.phoneNumber,
    required this.userCode,
    required this.serviceCredit,
    required this.cashCredit,
    required this.registrationDate,
    required this.machineType,
    required this.machineSerial,
    required this.slideNumber,
    required this.slideType,
    required this.ShopName,
  });

  String firstName;
  String lastName;
  String userName;
  String email;
  bool isActive;
  String role;
  String? phoneNumber;
  dynamic userCode;
  dynamic serviceCredit;
  dynamic cashCredit;
  RegistrationDate registrationDate;
  String machineType;
  String machineSerial;
  String slideNumber;
  String slideType;
  String ? ShopName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    userName: json["UserName"],
    email: json["Email"],
    isActive: json["IsActive"],
    role: json["Role"],
    phoneNumber: json["PhoneNumber"],
    userCode: json["UserCode"],
    serviceCredit: json["ServiceCredit"]?.toDouble(),
    cashCredit: json["CashCredit"],
    registrationDate: RegistrationDate.fromJson(json["RegistrationDate"]),
    machineType: json["MachineType"],
    machineSerial: json["MachineSerial"],
    slideNumber: json["SlideNumber"],
    slideType: json["SlideType"],
    ShopName: json["ShopName"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "UserName": userName,
    "Email": email,
    "IsActive": isActive,
    "Role": role,
    "PhoneNumber": phoneNumber,
    "UserCode": userCode,
    "ServiceCredit": serviceCredit,
    "CashCredit": cashCredit,
    "RegistrationDate": registrationDate.toJson(),
    "MachineType": machineType,
    "MachineSerial": machineSerial,
    "SlideNumber": slideNumber,
    "SlideType": slideType,
    "ShopName": ShopName,
  };
}

class RegistrationDate {
  RegistrationDate({
    required this.date,
    required this.time,
  });

  String date;
  String time;

  factory RegistrationDate.fromJson(Map<String, dynamic> json) => RegistrationDate(
    date: json["Date"],
    time: json["Time"],
  );

  Map<String, dynamic> toJson() => {
    "Date": date,
    "Time": time,
  };
}
