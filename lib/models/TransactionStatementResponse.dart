// To parse this JSON data, do
//
//     final transactionStatementResponse = transactionStatementResponseFromJson(jsonString);

import 'dart:convert';

TransactionStatementResponse transactionStatementResponseFromJson(String str) =>
    TransactionStatementResponse.fromJson(json.decode(str));

String transactionStatementResponseToJson(TransactionStatementResponse data) =>
    json.encode(data.toJson());

class TransactionStatementResponse {
  TransactionStatementResponse({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory TransactionStatementResponse.fromJson(Map<String, dynamic> json) =>
      TransactionStatementResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.date,
    required this.amount,
    required this.type,
    required this.description,
    required this.balance,
  });

  String date;
  double amount;
  String type;
  String description;
  double balance;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        amount: json["amount"].toDouble(),
        type: json["type"],
        description: json["description"],
        balance: json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "amount": amount,
        "type": type,
        "description": description,
        "balance": balance,
      };
}
