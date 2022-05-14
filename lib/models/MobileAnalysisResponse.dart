import 'dart:convert';

import 'BehaviouralAnalysis.dart';
import 'CashFlowAnalysis.dart';
import 'IncomeAnalysis.dart';
import 'SpendAnalysis.dart';
import 'TransactionPatternAnalysis.dart';

MobileAnalysisResponse mobileAnalysisResponseFromJson(String str) =>
    MobileAnalysisResponse.fromJson(json.decode(str));

String mobileAnalysisResponseToJson(MobileAnalysisResponse data) =>
    json.encode(data.toJson());

class MobileAnalysisResponse {
  MobileAnalysisResponse({
    required this.status,
    required this.msg,
    this.key,
    this.name,
    this.source,
    this.clientBvn,
    this.clientNin,
    this.clientFullName,
    this.clientPhoneNumber,
    this.accountType,
    this.accountBalance,
    this.accountId,
    this.accountName,
    this.bankName,
    this.startDate,
    this.endDate,
    this.createdDate,
    this.processingStatus,
    this.spendAnalysis,
    this.transactionPatternAnalysis,
    this.behavioralAnalysis,
    this.cashFlowAnalysis,
    this.incomeAnalysis,
    this.confidenceOnParsing,
  });

  bool status;
  String msg;
  int? key;
  String? name;
  String? source;
  String? clientBvn;
  dynamic clientNin;
  dynamic clientFullName;
  dynamic clientPhoneNumber;
  dynamic accountType;
  dynamic accountBalance;
  dynamic accountId;
  dynamic accountName;
  dynamic bankName;
  String? startDate;
  String? endDate;
  String? createdDate;
  String? processingStatus;
  SpendAnalysis? spendAnalysis;
  TransactionPatternAnalysis? transactionPatternAnalysis;
  BehavioralAnalysis? behavioralAnalysis;
  CashFlowAnalysis? cashFlowAnalysis;
  IncomeAnalysis? incomeAnalysis;
  int? confidenceOnParsing;

  factory MobileAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      MobileAnalysisResponse(
        status: json["status"],
        msg: json["msg"],
        key: json["key"],
        name: json["name"],
        source: json["source"],
        clientBvn: json["clientBvn"],
        clientNin: json["clientNin"],
        clientFullName: json["clientFullName"],
        clientPhoneNumber: json["clientPhoneNumber"],
        accountType: json["accountType"],
        accountBalance: json["accountBalance"],
        accountId: json["accountId"],
        accountName: json["accountName"],
        bankName: json["bankName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdDate: json["createdDate"],
        processingStatus: json["processingStatus"],
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
        "status": status,
        "msg": msg,
        "key": key,
        "name": name,
        "source": source,
        "clientBvn": clientBvn,
        "clientNin": clientNin,
        "clientFullName": clientFullName,
        "clientPhoneNumber": clientPhoneNumber,
        "accountType": accountType,
        "accountBalance": accountBalance,
        "accountId": accountId,
        "accountName": accountName,
        "bankName": bankName,
        "startDate": startDate,
        "endDate": endDate,
        "createdDate": createdDate,
        "processingStatus": processingStatus,
        "spendAnalysis": spendAnalysis?.toJson(),
        "transactionPatternAnalysis": transactionPatternAnalysis?.toJson(),
        "behavioralAnalysis": behavioralAnalysis?.toJson(),
        "cashFlowAnalysis": cashFlowAnalysis?.toJson(),
        "incomeAnalysis": incomeAnalysis?.toJson(),
        "confidenceOnParsing": confidenceOnParsing,
      };
}
