// To parse this JSON data, do
//
//     final resellerAssignMachineDetails = resellerAssignMachineDetailsFromJson(jsonString);

import 'dart:convert';

ResellerAssignMachineDetails resellerAssignMachineDetailsFromJson(String str) =>
    ResellerAssignMachineDetails.fromJson(json.decode(str));

String resellerAssignMachineDetailsToJson(ResellerAssignMachineDetails data) =>
    json.encode(data.toJson());

class ResellerAssignMachineDetails {
  List<Datum> data;
  int code;
  String message;

  ResellerAssignMachineDetails({
    required this.data,
    required this.code,
    required this.message,
  });

  factory ResellerAssignMachineDetails.fromJson(Map<String, dynamic> json) =>
      ResellerAssignMachineDetails(
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
  String machineName;
  String serial;
  int machineSerialId;
  String machineObtainingDate;
  int resellerId;
  String resellerFullName;
  String actionDate;
  bool isActive;
  dynamic installmentsNumber;
  dynamic installmentValue;
  dynamic remainInstallments;
  dynamic advance;
  String installmentType;
  String machineInstallment;

  Datum({
    required this.id,
    required this.machineName,
    required this.serial,
    required this.machineSerialId,
    required this.machineObtainingDate,
    required this.resellerId,
    required this.resellerFullName,
    required this.actionDate,
    required this.isActive,
    required this.installmentsNumber,
    required this.installmentValue,
    required this.remainInstallments,
    required this.advance,
    required this.installmentType,
    required this.machineInstallment,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        machineName: json["MachineName"],
        serial: json["Serial"],
        machineSerialId: json["MachineSerialId"],
        machineObtainingDate: json["MachineObtainingDate"],
        resellerId: json["ResellerId"],
        resellerFullName: json["ResellerFullName"],
        actionDate: json["ActionDate"],
        isActive: json["IsActive"],
        installmentsNumber: json["InstallmentsNumber"],
        installmentValue: json["InstallmentValue"],
        remainInstallments: json["RemainInstallments"],
        advance: json["Advance"],
        installmentType: json["InstallmentType"],
        machineInstallment: json["MachineInstallment"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "MachineName": machineName,
        "Serial": serial,
        "MachineSerialId": machineSerialId,
        "MachineObtainingDate": machineObtainingDate,
        "ResellerId": resellerId,
        "ResellerFullName": resellerFullName,
        "ActionDate": actionDate,
        "IsActive": isActive,
        "InstallmentsNumber": installmentsNumber,
        "InstallmentValue": installmentValue,
        "RemainInstallments": remainInstallments,
        "Advance": advance,
        "InstallmentType": installmentType,
        "MachineInstallment": machineInstallment,
      };
}
