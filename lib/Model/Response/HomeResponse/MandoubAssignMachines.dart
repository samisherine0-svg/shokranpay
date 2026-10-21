// To parse this JSON data, do
//
//     final mandoubAssignMachines = mandoubAssignMachinesFromJson(jsonString);

import 'dart:convert';

MandoubAssignMachines mandoubAssignMachinesFromJson(String str) => MandoubAssignMachines.fromJson(json.decode(str));

String mandoubAssignMachinesToJson(MandoubAssignMachines data) => json.encode(data.toJson());

class MandoubAssignMachines {
  List<Datum> data;
  int code;
  String message;

  MandoubAssignMachines({
    required this.data,
    required this.code,
    required this.message,
  });

  factory MandoubAssignMachines.fromJson(Map<String, dynamic> json) => MandoubAssignMachines(
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
  String createdDate;
  int resellerId;
  String resellerFullName;
  String statusName;
  String assignDate;
  bool isActive;

  Datum({
    required this.id,
    required this.machineName,
    required this.serial,
    required this.machineSerialId,
    required this.createdDate,
    required this.resellerId,
    required this.resellerFullName,
    required this.statusName,
    required this.assignDate,
    required this.isActive,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    machineName: json["MachineName"],
    serial: json["Serial"],
    machineSerialId: json["MachineSerialId"],
    createdDate: json["CreatedDate"],
    resellerId: json["ResellerId"],
    resellerFullName: json["ResellerFullName"],
    statusName: json["StatusName"],
    assignDate: json["AssignDate"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MachineName": machineName,
    "Serial": serial,
    "MachineSerialId": machineSerialId,
    "CreatedDate": createdDate,
    "ResellerId": resellerId,
    "ResellerFullName": resellerFullName,
    "StatusName": statusName,
    "AssignDate": assignDate,
    "IsActive": isActive,
  };
}
