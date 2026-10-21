// To parse this JSON data, do
//
//     final machineSerials = machineSerialsFromJson(jsonString);

import 'dart:convert';

MachineSerials machineSerialsFromJson(String str) => MachineSerials.fromJson(json.decode(str));

String machineSerialsToJson(MachineSerials data) => json.encode(data.toJson());

class MachineSerials {
  List<Datum> data;
  int code;
  String message;

  MachineSerials({
    required this.data,
    required this.code,
    required this.message,
  });

  factory MachineSerials.fromJson(Map<String, dynamic> json) => MachineSerials(
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
  String serial;

  Datum({
    required this.id,
    required this.serial,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    serial: json["Serial"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Serial": serial,
  };
}
