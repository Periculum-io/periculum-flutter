import 'dart:convert';

import 'package:flutter_periculum/models/MobileAnalysisResponse.dart';

MobileAnalysisResponseV2 getMobileV2InsightOverviewFromJson(String str) =>
    MobileAnalysisResponseV2.fromJson(json.decode(str));

String getMobileV2InsightOverviewToJson(MobileAnalysisResponseV2 data) =>
    json.encode(data.toJson());

class MobileAnalysisResponseV2 {
  MobileAnalysisResponseV2({
    this.key,
    this.name,
    this.createdTime,
    this.updatedTime,
    this.deviceType,
    this.networkCarrier,
    this.firstInstalledTime,
    this.totalClosingBalance,
    this.totalNumberOfTransactions,
  });

  int? key;
  String? name;
  String? createdTime;
  String? updatedTime;
  String? deviceType;
  String? networkCarrier;
  String? firstInstalledTime;
  int? totalClosingBalance;
  int? totalNumberOfTransactions;

  factory MobileAnalysisResponseV2.fromJson(Map<String, dynamic> json) =>
      MobileAnalysisResponseV2(
        key: json["key"],
        name: json["name"],
        createdTime: json["createdTime"],
        updatedTime: json["updatedTime"],
        deviceType: json["deviceType"],
        networkCarrier: json["networkCarrier"],
        firstInstalledTime: json["firstInstalledTime"],
        totalClosingBalance: json["totalClosingBalance"],
        totalNumberOfTransactions: json["totalNumberOfTransactions"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "createdTime": createdTime,
        "updatedTime": updatedTime,
        "deviceType": deviceType,
        "networkCarrier": networkCarrier,
        "firstInstalledTime": firstInstalledTime,
        "totalClosingBalance": totalClosingBalance,
        "totalNumberOfTransactions": totalNumberOfTransactions,
      };
}
