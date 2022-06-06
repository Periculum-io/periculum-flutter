import 'dart:convert';

GetMobileV2InsightOverview getMobileV2InsightOverviewFromJson(String str) =>
    GetMobileV2InsightOverview.fromJson(json.decode(str));

String getMobileV2InsightOverviewToJson(GetMobileV2InsightOverview data) =>
    json.encode(data.toJson());

class GetMobileV2InsightOverview {
  GetMobileV2InsightOverview({
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

  factory GetMobileV2InsightOverview.fromJson(Map<String, dynamic> json) =>
      GetMobileV2InsightOverview(
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
