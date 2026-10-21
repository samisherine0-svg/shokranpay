// To parse this JSON data, do
//
//     final creditResponse = creditResponseFromJson(jsonString);

import 'dart:convert';

CreditResponse creditResponseFromJson(String str) => CreditResponse.fromJson(json.decode(str));

String creditResponseToJson(CreditResponse data) => json.encode(data.toJson());

class CreditResponse {
  CreditResponse({
    required this.data,
    required this.code,
    required this.message,
  });

  List<Datum> data;
  int code;
  String message;

  factory CreditResponse.fromJson(Map<String, dynamic> json) => CreditResponse(
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
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    key: json["Key"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Key": key,
    "Value": value,
  };
}
