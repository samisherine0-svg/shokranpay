// To parse this JSON data, do
//
//     final notificationsResponse = notificationsResponseFromJson(jsonString);

import 'dart:convert';

NotificationsResponse notificationsResponseFromJson(String str) => NotificationsResponse.fromJson(json.decode(str));

String notificationsResponseToJson(NotificationsResponse data) => json.encode(data.toJson());

class NotificationsResponse {
  List<Datum> data;
  int code;
  String message;

  NotificationsResponse({
    required this.data,
    required this.code,
    required this.message,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) => NotificationsResponse(
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
  String subject;
  CreatedDate createdDate;
  int id;
  String body;

  Datum({
    required this.subject,
    required this.createdDate,
    required this.id,
    required this.body,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subject: json["Subject"],
    createdDate: CreatedDate.fromJson(json["CreatedDate"]),
    id: json["Id"],
    body: json["Body"],
  );

  Map<String, dynamic> toJson() => {
    "Subject": subject,
    "CreatedDate": createdDate.toJson(),
    "Id": id,
    "Body": body,
  };
}

class CreatedDate {
  String date;
  String time;

  CreatedDate({
    required this.date,
    required this.time,
  });

  factory CreatedDate.fromJson(Map<String, dynamic> json) => CreatedDate(
    date: json["Date"],
    time: json["Time"],
  );

  Map<String, dynamic> toJson() => {
    "Date": date,
    "Time": time,
  };
}
