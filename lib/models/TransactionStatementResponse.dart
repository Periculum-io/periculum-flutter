import 'dart:convert';

TransactionStatementResponse transactionStatementResponseFromJson(String str) =>
    TransactionStatementResponse.fromJson(json.decode(str));

String transactionStatementResponseToJson(TransactionStatementResponse data) =>
    json.encode(data.toJson());

class TransactionStatementResponse {
  TransactionStatementResponse(
      {required this.status, required this.transaction});

  bool status;
  List<Transaction> transaction;

  factory TransactionStatementResponse.fromJson(Map<String, dynamic> json) =>
      TransactionStatementResponse(
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
