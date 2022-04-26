// To parse this JSON data, do
//
//     final statement = statementFromJson(jsonString);

import 'dart:convert';

List<Statement> statementFromJson(String str) =>
    List<Statement>.from(json.decode(str).map((x) => Statement.fromJson(x)));

String statementToJson(List<Statement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statement {
  Statement({
    required this.key,
    required this.name,
    this.clientFullName,
    this.clientPhoneNumber,
    required this.startDate,
    required this.endDate,
    required this.createdDate,
    required this.processingStatus,
    required this.confidenceInParsing,
  });

  int key;
  String name;
  dynamic clientFullName;
  dynamic clientPhoneNumber;
  DateTime startDate;
  DateTime endDate;
  DateTime createdDate;
  String processingStatus;
  int confidenceInParsing;

  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        key: json["key"],
        name: json["name"],
        clientFullName: json["clientFullName"],
        clientPhoneNumber: json["clientPhoneNumber"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        createdDate: DateTime.parse(json["createdDate"]),
        processingStatus: json["processingStatus"],
        confidenceInParsing: json["confidenceInParsing"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "clientFullName": clientFullName,
        "clientPhoneNumber": clientPhoneNumber,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "createdDate":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "processingStatus": processingStatus,
        "confidenceInParsing": confidenceInParsing,
      };
}
