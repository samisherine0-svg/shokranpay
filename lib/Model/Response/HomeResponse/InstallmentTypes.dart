// To parse this JSON data, do
//
//     final machineInstallmentTypes = machineInstallmentTypesFromJson(jsonString);

import 'dart:convert';

MachineInstallmentTypes machineInstallmentTypesFromJson(String str) =>
    MachineInstallmentTypes.fromJson(json.decode(str));

String machineInstallmentTypesToJson(MachineInstallmentTypes data) =>
    json.encode(data.toJson());

class MachineInstallmentTypes {
  List<Datum> data;
  int code;
  String message;

  MachineInstallmentTypes({
    required this.data,
    required this.code,
    required this.message,
  });

  factory MachineInstallmentTypes.fromJson(Map<String, dynamic> json) =>
      MachineInstallmentTypes(
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
  int id;
  String name;
  dynamic installmentsNumber;
  dynamic installmentValue;
  dynamic advance;

  Datum({
    required this.id,
    required this.name,
    required this.installmentsNumber,
    required this.installmentValue,
    required this.advance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        name: json["Name"],
        installmentsNumber: json["InstallmentsNumber"],
        installmentValue: json["InstallmentValue"],
        advance: json["Advance"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "InstallmentsNumber": installmentsNumber,
        "InstallmentValue": installmentValue,
        "Advance": advance,
      };
}
