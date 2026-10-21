// To parse this JSON data, do
//
//     final machineTypes = machineTypesFromJson(jsonString);

import 'dart:convert';

MachineTypes machineTypesFromJson(String str) => MachineTypes.fromJson(json.decode(str));

String machineTypesToJson(MachineTypes data) => json.encode(data.toJson());

class MachineTypes {
  List<Datum> data;
  int code;
  String message;

  MachineTypes({
    required this.data,
    required this.code,
    required this.message,
  });

  factory MachineTypes.fromJson(Map<String, dynamic> json) => MachineTypes(
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

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
