import 'dart:convert';

List<TransactionResponse> transactionResponseFromJson(String str) =>
    List<TransactionResponse>.from(
        json.decode(str).map((x) => TransactionResponse.fromJson(x)));

String transactionResponseToJson(List<TransactionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionResponse {
  TransactionResponse({
    this.key,
    this.narration,
    this.type,
    this.amount,
  });

  int? key;
  String? narration;
  String? type;
  double? amount;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        key: json["key"],
        narration: json["narration"],
        type: json["type"],
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "narration": narration,
        "type": type,
        "amount": amount,
      };
}
