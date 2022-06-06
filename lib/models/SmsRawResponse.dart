import 'dart:convert';

List<RawSmsResponse> rawSmsResponseFromJson(String str) =>
    List<RawSmsResponse>.from(
        json.decode(str).map((x) => RawSmsResponse.fromJson(x)));

String rawSmsResponseToJson(List<RawSmsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RawSmsResponse {
  RawSmsResponse({
    this.key,
    this.body,
    this.date,
  });

  int? key;
  String? body;
  DateTime? date;

  factory RawSmsResponse.fromJson(Map<String, dynamic> json) => RawSmsResponse(
        key: json["key"],
        body: json["body"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "body": body,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
