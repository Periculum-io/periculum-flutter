import 'dart:convert';

OverviewKey overviewKeyFromJson(String str) =>
    OverviewKey.fromJson(json.decode(str));

String overviewKeyToJson(OverviewKey data) => json.encode(data.toJson());

class OverviewKey {
  OverviewKey({
    this.mobileInsightsOverviewKey,
  });

  int? mobileInsightsOverviewKey;

  factory OverviewKey.fromJson(Map<String, dynamic> json) => OverviewKey(
        mobileInsightsOverviewKey: json["mobileInsightsOverviewKey"],
      );

  Map<String, dynamic> toJson() => {
        "mobileInsightsOverviewKey": mobileInsightsOverviewKey,
      };
}
