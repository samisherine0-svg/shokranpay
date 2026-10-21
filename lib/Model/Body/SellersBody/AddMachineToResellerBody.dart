// To parse this JSON data, do
//
//     final addMachineToResellerBody = addMachineToResellerBodyFromJson(jsonString);

import 'dart:convert';

AddMachineToResellerBody addMachineToResellerBodyFromJson(String str) => AddMachineToResellerBody.fromJson(json.decode(str));

String addMachineToResellerBodyToJson(AddMachineToResellerBody data) => json.encode(data.toJson());

class AddMachineToResellerBody {
  String resellerCode;
  String installmentTypeId;
  String machineSerialId;

  AddMachineToResellerBody({
    required this.resellerCode,
    required this.installmentTypeId,
    required this.machineSerialId,
  });

  factory AddMachineToResellerBody.fromJson(Map<String, dynamic> json) => AddMachineToResellerBody(
    resellerCode: json["ResellerCode"],
    installmentTypeId: json["InstallmentTypeId"],
    machineSerialId: json["MachineSerialId"],
  );

  Map<String, dynamic> toJson() => {
    "ResellerCode": resellerCode,
    "InstallmentTypeId": installmentTypeId,
    "MachineSerialId": machineSerialId,
  };
}
