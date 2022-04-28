import 'dart:convert';

StatementTransactionResponse statementTransactionResponseFromJson(String str) =>
    StatementTransactionResponse.fromJson(json.decode(str));

String statementTransactionResponseToJson(StatementTransactionResponse data) =>
    json.encode(data.toJson());

class StatementTransactionResponse {
  StatementTransactionResponse(
      {required this.status, required this.transaction});

  bool status;
  List<Transaction> transaction;

  factory StatementTransactionResponse.fromJson(Map<String, dynamic> json) =>
      StatementTransactionResponse(
        status: json["status"],
        transaction: List<Transaction>.from(
            json["data"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(transaction.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
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

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
