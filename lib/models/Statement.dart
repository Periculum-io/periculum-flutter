import 'dart:convert';

import 'BehaviouralAnalysis.dart';
import 'CashFlowAnalysis.dart';
import 'ClientIndentification.dart';
import 'IncomeAnalysis.dart';
import 'SpendAnalysis.dart';
import 'TransactionPatternAnalysis.dart';

StatementResponse statementResponseFromJson(String str) =>
    StatementResponse.fromJson(json.decode(str));

String statementResponseToJson(StatementResponse data) =>
    json.encode(data.toJson());

class StatementResponse {
  StatementResponse({
    required this.key,
    required this.name,
    required this.source,
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.accountType,
    required this.accountBalance,
    required this.accountId,
    required this.accountName,
    required this.bankName,
    required this.statementType,
    required this.startDate,
    required this.endDate,
    required this.createdDate,
    required this.processingStatus,
    required this.clientIdentification,
    required this.spendAnalysis,
    required this.transactionPatternAnalysis,
    required this.behavioralAnalysis,
    required this.cashFlowAnalysis,
    required this.incomeAnalysis,
    required this.confidenceOnParsing,
  });

  int key;
  String name;
  String source;
  dynamic clientFullName;
  dynamic clientPhoneNumber;
  dynamic accountType;
  dynamic accountBalance;
  dynamic accountId;
  dynamic accountName;
  dynamic bankName;
  String statementType;
  DateTime startDate;
  DateTime endDate;
  DateTime createdDate;
  String processingStatus;
  List<ClientIdentification> clientIdentification;
  SpendAnalysis spendAnalysis;
  TransactionPatternAnalysis transactionPatternAnalysis;
  BehavioralAnalysis behavioralAnalysis;
  CashFlowAnalysis cashFlowAnalysis;
  IncomeAnalysis incomeAnalysis;
  int confidenceOnParsing;

  factory StatementResponse.fromJson(Map<String, dynamic> json) =>
      StatementResponse(
        key: json["key"],
        name: json["name"],
        source: json["source"],
        clientFullName: json["clientFullName"],
        clientPhoneNumber: json["clientPhoneNumber"],
        accountType: json["accountType"],
        accountBalance: json["accountBalance"],
        accountId: json["accountId"],
        accountName: json["accountName"],
        bankName: json["bankName"],
        statementType: json["statementType"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        createdDate: DateTime.parse(json["createdDate"]),
        processingStatus: json["processingStatus"],
        clientIdentification: List<ClientIdentification>.from(
            json["clientIdentification"]
                .map((x) => ClientIdentification.fromJson(x))),
        spendAnalysis: SpendAnalysis.fromJson(json["spendAnalysis"]),
        transactionPatternAnalysis: TransactionPatternAnalysis.fromJson(
            json["transactionPatternAnalysis"]),
        behavioralAnalysis:
            BehavioralAnalysis.fromJson(json["behavioralAnalysis"]),
        cashFlowAnalysis: CashFlowAnalysis.fromJson(json["cashFlowAnalysis"]),
        incomeAnalysis: IncomeAnalysis.fromJson(json["incomeAnalysis"]),
        confidenceOnParsing: json["confidenceOnParsing"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "source": source,
        "clientFullName": clientFullName,
        "clientPhoneNumber": clientPhoneNumber,
        "accountType": accountType,
        "accountBalance": accountBalance,
        "accountId": accountId,
        "accountName": accountName,
        "bankName": bankName,
        "statementType": statementType,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "createdDate": createdDate.toIso8601String(),
        "processingStatus": processingStatus,
        "clientIdentification":
            List<dynamic>.from(clientIdentification.map((x) => x.toJson())),
        "spendAnalysis": spendAnalysis.toJson(),
        "transactionPatternAnalysis": transactionPatternAnalysis.toJson(),
        "behavioralAnalysis": behavioralAnalysis.toJson(),
        "cashFlowAnalysis": cashFlowAnalysis.toJson(),
        "incomeAnalysis": incomeAnalysis.toJson(),
        "confidenceOnParsing": confidenceOnParsing,
      };
}
