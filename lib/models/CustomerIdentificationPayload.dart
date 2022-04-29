// To parse this JSON data, do
//
//     final customerIdentificationPayload = customerIdentificationPayloadFromJson(jsonString);

import 'dart:convert';

CustomerIdentificationPayload customerIdentificationPayloadFromJson(
        String str) =>
    CustomerIdentificationPayload.fromJson(json.decode(str));

String customerIdentificationPayloadToJson(
        CustomerIdentificationPayload data) =>
    json.encode(data.toJson());

class CustomerIdentificationPayload {
  CustomerIdentificationPayload({
    required this.statementKey,
    required this.identificationData,
  });

  int statementKey;
  List<IdentificationData> identificationData;

  factory CustomerIdentificationPayload.fromJson(Map<String, dynamic> json) =>
      CustomerIdentificationPayload(
        statementKey: json["statementKey"],
        identificationData: List<IdentificationData>.from(
            json["identificationData"]
                .map((x) => IdentificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statementKey": statementKey,
        "identificationData":
            List<dynamic>.from(identificationData.map((x) => x.toJson())),
      };
}

class IdentificationData {
  IdentificationData({
    required this.identifierName,
    required this.value,
  });

  String identifierName;
  String value;

  factory IdentificationData.fromJson(Map<String, dynamic> json) =>
      IdentificationData(
        identifierName: json["IdentifierName"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "IdentifierName": identifierName,
        "Value": value,
      };
}
