// To parse this JSON data, do
//
//     final mobileAnalysisResponse = mobileAnalysisResponseFromJson(jsonString);

import 'dart:convert';

MobileAnalysisResponse mobileAnalysisResponseFromJson(String str) => MobileAnalysisResponse.fromJson(json.decode(str));

String mobileAnalysisResponseToJson(MobileAnalysisResponse data) => json.encode(data.toJson());

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
  dynamic? clientNin;
  dynamic? clientFullName;
  dynamic? clientPhoneNumber;
  dynamic? accountType;
  dynamic? accountBalance;
  dynamic? accountId;
  dynamic? accountName;
  dynamic? bankName;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdDate;
  String? processingStatus;
  SpendAnalysis? spendAnalysis;
  TransactionPatternAnalysis? transactionPatternAnalysis;
  BehavioralAnalysis? behavioralAnalysis;
  CashFlowAnalysis? cashFlowAnalysis;
  IncomeAnalysis? incomeAnalysis;
  int? confidenceOnParsing;

  factory MobileAnalysisResponse.fromJson(Map<String, dynamic> json) => MobileAnalysisResponse(
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
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    createdDate: DateTime.parse(json["createdDate"]),
    processingStatus: json["processingStatus"],
    spendAnalysis: SpendAnalysis.fromJson(json["spendAnalysis"]),
    transactionPatternAnalysis: TransactionPatternAnalysis.fromJson(json["transactionPatternAnalysis"]),
    behavioralAnalysis: BehavioralAnalysis.fromJson(json["behavioralAnalysis"]),
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
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "createdDate": createdDate?.toIso8601String(),
    "processingStatus": processingStatus,
    "spendAnalysis": spendAnalysis?.toJson(),
    "transactionPatternAnalysis": transactionPatternAnalysis?.toJson(),
    "behavioralAnalysis": behavioralAnalysis?.toJson(),
    "cashFlowAnalysis": cashFlowAnalysis?.toJson(),
    "incomeAnalysis": incomeAnalysis?.toJson(),
    "confidenceOnParsing": confidenceOnParsing,
  };
}

class BehavioralAnalysis {
  BehavioralAnalysis({
    this.monthToMonthInflowToOutflowRate,
    this.overallInflowToOutflowRate,
    this.totalLoanAmount,
    this.totalLoanRepaymentAmount,
    this.loanInflowRate,
    this.loanRepaymentToInflowRate,
    this.numberOfCreditLoanTransactions,
    this.numberOfDebitRepaymentTransactions,
    this.gamblingStatus,
    this.gamblingRate,
    this.accountActivity,
    this.percentOfInflowIrregularity,
    this.averageMonthlyLoanAmount,
    this.averageMonthlyLoanRepaymentAmount,
    this.accountSweep,
  });

  String? monthToMonthInflowToOutflowRate;
  String? overallInflowToOutflowRate;
  int? totalLoanAmount;
  int? totalLoanRepaymentAmount;
  int? loanInflowRate;
  int? loanRepaymentToInflowRate;
  int? numberOfCreditLoanTransactions;
  int? numberOfDebitRepaymentTransactions;
  String? gamblingStatus;
  int? gamblingRate;
  double? accountActivity;
  double? percentOfInflowIrregularity;
  int? averageMonthlyLoanAmount;
  int? averageMonthlyLoanRepaymentAmount;
  dynamic? accountSweep;

  factory BehavioralAnalysis.fromJson(Map<String, dynamic> json) => BehavioralAnalysis(
    monthToMonthInflowToOutflowRate: json["monthToMonthInflowToOutflowRate"],
    overallInflowToOutflowRate: json["overallInflowToOutflowRate"],
    totalLoanAmount: json["totalLoanAmount"],
    totalLoanRepaymentAmount: json["totalLoanRepaymentAmount"],
    loanInflowRate: json["loanInflowRate"],
    loanRepaymentToInflowRate: json["loanRepaymentToInflowRate"],
    numberOfCreditLoanTransactions: json["numberOfCreditLoanTransactions"],
    numberOfDebitRepaymentTransactions: json["numberOfDebitRepaymentTransactions"],
    gamblingStatus: json["gamblingStatus"],
    gamblingRate: json["gamblingRate"],
    accountActivity: json["accountActivity"].toDouble(),
    percentOfInflowIrregularity: json["percentOfInflowIrregularity"].toDouble(),
    averageMonthlyLoanAmount: json["averageMonthlyLoanAmount"],
    averageMonthlyLoanRepaymentAmount: json["averageMonthlyLoanRepaymentAmount"],
    accountSweep: json["accountSweep"],
  );

  Map<String, dynamic> toJson() => {
    "monthToMonthInflowToOutflowRate": monthToMonthInflowToOutflowRate,
    "overallInflowToOutflowRate": overallInflowToOutflowRate,
    "totalLoanAmount": totalLoanAmount,
    "totalLoanRepaymentAmount": totalLoanRepaymentAmount,
    "loanInflowRate": loanInflowRate,
    "loanRepaymentToInflowRate": loanRepaymentToInflowRate,
    "numberOfCreditLoanTransactions": numberOfCreditLoanTransactions,
    "numberOfDebitRepaymentTransactions": numberOfDebitRepaymentTransactions,
    "gamblingStatus": gamblingStatus,
    "gamblingRate": gamblingRate,
    "accountActivity": accountActivity,
    "percentOfInflowIrregularity": percentOfInflowIrregularity,
    "averageMonthlyLoanAmount": averageMonthlyLoanAmount,
    "averageMonthlyLoanRepaymentAmount": averageMonthlyLoanRepaymentAmount,
    "accountSweep": accountSweep,
  };
}

class CashFlowAnalysis {
  CashFlowAnalysis({
    this.totalCreditTurnover,
    this.totalDebitTurnOver,
    this.averageMonthlyCredits,
    this.averageMonthlyDebits,
    this.averageWeeklyCredits,
    this.averageWeeklyDebits,
    this.averageMonthlyBalance,
    this.averageWeeklyBalance,
    this.numberOfTransactingMonths,
    this.periodInStatement,
    this.yearInStatement,
    this.firstDateInStatement,
    this.lastDateInStatement,
    this.closingBalance,
  });

  double? totalCreditTurnover;
  double? totalDebitTurnOver;
  double? averageMonthlyCredits;
  double? averageMonthlyDebits;
  double? averageWeeklyCredits;
  double? averageWeeklyDebits;
  double? averageMonthlyBalance;
  double? averageWeeklyBalance;
  int? numberOfTransactingMonths;
  String? periodInStatement;
  String? yearInStatement;
  DateTime? firstDateInStatement;
  DateTime? lastDateInStatement;
  double? closingBalance;

  factory CashFlowAnalysis.fromJson(Map<String, dynamic> json) => CashFlowAnalysis(
    totalCreditTurnover: json["totalCreditTurnover"].toDouble(),
    totalDebitTurnOver: json["totalDebitTurnOver"].toDouble(),
    averageMonthlyCredits: json["averageMonthlyCredits"].toDouble(),
    averageMonthlyDebits: json["averageMonthlyDebits"].toDouble(),
    averageWeeklyCredits: json["averageWeeklyCredits"].toDouble(),
    averageWeeklyDebits: json["averageWeeklyDebits"].toDouble(),
    averageMonthlyBalance: json["averageMonthlyBalance"].toDouble(),
    averageWeeklyBalance: json["averageWeeklyBalance"].toDouble(),
    numberOfTransactingMonths: json["numberOfTransactingMonths"],
    periodInStatement: json["periodInStatement"],
    yearInStatement: json["yearInStatement"],
    firstDateInStatement: DateTime.parse(json["firstDateInStatement"]),
    lastDateInStatement: DateTime.parse(json["lastDateInStatement"]),
    closingBalance: json["closingBalance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "totalCreditTurnover": totalCreditTurnover,
    "totalDebitTurnOver": totalDebitTurnOver,
    "averageMonthlyCredits": averageMonthlyCredits,
    "averageMonthlyDebits": averageMonthlyDebits,
    "averageWeeklyCredits": averageWeeklyCredits,
    "averageWeeklyDebits": averageWeeklyDebits,
    "averageMonthlyBalance": averageMonthlyBalance,
    "averageWeeklyBalance": averageWeeklyBalance,
    "numberOfTransactingMonths": numberOfTransactingMonths,
    "periodInStatement": periodInStatement,
    "yearInStatement": yearInStatement,
    "firstDateInStatement": "${firstDateInStatement?.year.toString().padLeft(4, '0')}-${firstDateInStatement?.month.toString().padLeft(2, '0')}-${firstDateInStatement?.day.toString().padLeft(2, '0')}",
    "lastDateInStatement": "${lastDateInStatement?.year.toString().padLeft(4, '0')}-${lastDateInStatement?.month.toString().padLeft(2, '0')}-${lastDateInStatement?.day.toString().padLeft(2, '0')}",
    "closingBalance": closingBalance,
  };
}

class IncomeAnalysis {
  IncomeAnalysis({
    this.averagePredictedSalary,
    this.isSalaryEarner,
    this.expectedSalaryPaymentDay,
    this.frequencyOfSalaryPayments,
    this.lastDateOfSalaryPayment,
    this.numberOfSalaryPayments,
    this.hasOtherIncome,
    this.averageOtherIncome,
    this.numberOfOtherIncomePayments,
    this.netAverageMonthlyEarning,
  });

  int? averagePredictedSalary;
  String? isSalaryEarner;
  dynamic? expectedSalaryPaymentDay;
  dynamic? frequencyOfSalaryPayments;
  dynamic? lastDateOfSalaryPayment;
  int? numberOfSalaryPayments;
  String? hasOtherIncome;
  int? averageOtherIncome;
  int? numberOfOtherIncomePayments;
  int? netAverageMonthlyEarning;

  factory IncomeAnalysis.fromJson(Map<String, dynamic> json) => IncomeAnalysis(
    averagePredictedSalary: json["averagePredictedSalary"],
    isSalaryEarner: json["isSalaryEarner"],
    expectedSalaryPaymentDay: json["expectedSalaryPaymentDay"],
    frequencyOfSalaryPayments: json["frequencyOfSalaryPayments"],
    lastDateOfSalaryPayment: json["lastDateOfSalaryPayment"],
    numberOfSalaryPayments: json["numberOfSalaryPayments"],
    hasOtherIncome: json["hasOtherIncome"],
    averageOtherIncome: json["averageOtherIncome"],
    numberOfOtherIncomePayments: json["numberOfOtherIncomePayments"],
    netAverageMonthlyEarning: json["netAverageMonthlyEarning"],
  );

  Map<String, dynamic> toJson() => {
    "averagePredictedSalary": averagePredictedSalary,
    "isSalaryEarner": isSalaryEarner,
    "expectedSalaryPaymentDay": expectedSalaryPaymentDay,
    "frequencyOfSalaryPayments": frequencyOfSalaryPayments,
    "lastDateOfSalaryPayment": lastDateOfSalaryPayment,
    "numberOfSalaryPayments": numberOfSalaryPayments,
    "hasOtherIncome": hasOtherIncome,
    "averageOtherIncome": averageOtherIncome,
    "numberOfOtherIncomePayments": numberOfOtherIncomePayments,
    "netAverageMonthlyEarning": netAverageMonthlyEarning,
  };
}

class SpendAnalysis {
  SpendAnalysis({
    this.averageMonthlySpendOnTransfer,
    this.averageMonthlySpendOnAtmAndPos,
    this.averageMonthlySpendOnUssd,
    this.averageMonthlySpendOnGambling,
    this.averageMonthlySpendOnAirtimeAndData,
    this.averageMonthlySpendOnUtilities,
    this.averageMonthlySpendOnOnlineAndWeb,
    this.averageMonthlySpendOnTransportation,
    this.averageMonthlySpendOnHealth,
    this.averageMonthlySpendOnTravel,
    this.averageMonthlySpendOnEntertainment,
    this.averageMonthlySpendOnHospitalityAndFood,
    this.averageMonthlySpendOnRent,
    this.averageMonthlySpendOnInsurance,
    this.averageMonthlySpendOnChargesAndStampDuty,
    this.averageMonthlySpendOnInternationalTransactions,
    this.averageMonthlyTotalExpenses,
    this.averageMonthlyRecurringExpense,
    this.mostRecurringExpense,
    this.totalSpendOnTransfer,
    this.totalSpendOnAtmAndPos,
    this.totalSpendOnUssd,
    this.totalSpendOnGambling,
    this.totalSpendOnAirtimeAndData,
    this.totalSpendOnUtilities,
    this.totalSpendOnOnlineAndWeb,
    this.totalSpendOnTransportation,
    this.totalSpendOnHealth,
    this.totalSpendOnTravel,
    this.totalSpendOnEntertainment,
    this.totalSpendOnHospitalityAndFood,
    this.totalSpendOnRent,
    this.totalSpendOnInsurance,
    this.totalSpendOnChargesAndStampDuty,
    this.totalSpendOnInternationalTransactions,
    this.totalMonthlyExpenses,
    this.totalRecurringExpense,
    this.totalExpenses,
    this.totalMonthlyExpense,
    this.atmLocations,
  });

  double? averageMonthlySpendOnTransfer;
  int? averageMonthlySpendOnAtmAndPos;
  double? averageMonthlySpendOnUssd;
  int? averageMonthlySpendOnGambling;
  double? averageMonthlySpendOnAirtimeAndData;
  int? averageMonthlySpendOnUtilities;
  int? averageMonthlySpendOnOnlineAndWeb;
  int? averageMonthlySpendOnTransportation;
  int? averageMonthlySpendOnHealth;
  int? averageMonthlySpendOnTravel;
  int? averageMonthlySpendOnEntertainment;
  int? averageMonthlySpendOnHospitalityAndFood;
  int? averageMonthlySpendOnRent;
  int? averageMonthlySpendOnInsurance;
  double? averageMonthlySpendOnChargesAndStampDuty;
  int? averageMonthlySpendOnInternationalTransactions;
  double? averageMonthlyTotalExpenses;
  int? averageMonthlyRecurringExpense;
  String? mostRecurringExpense;
  double? totalSpendOnTransfer;
  int? totalSpendOnAtmAndPos;
  double? totalSpendOnUssd;
  int? totalSpendOnGambling;
  int? totalSpendOnAirtimeAndData;
  int? totalSpendOnUtilities;
  int? totalSpendOnOnlineAndWeb;
  int? totalSpendOnTransportation;
  int? totalSpendOnHealth;
  int? totalSpendOnTravel;
  int? totalSpendOnEntertainment;
  int? totalSpendOnHospitalityAndFood;
  int? totalSpendOnRent;
  int? totalSpendOnInsurance;
  double? totalSpendOnChargesAndStampDuty;
  int? totalSpendOnInternationalTransactions;
  double? totalMonthlyExpenses;
  int? totalRecurringExpense;
  dynamic? totalExpenses;
  int? totalMonthlyExpense;
  dynamic? atmLocations;

  factory SpendAnalysis.fromJson(Map<String, dynamic> json) => SpendAnalysis(
    averageMonthlySpendOnTransfer: json["averageMonthlySpendOnTransfer"].toDouble(),
    averageMonthlySpendOnAtmAndPos: json["averageMonthlySpendOnAtmAndPOS"],
    averageMonthlySpendOnUssd: json["averageMonthlySpendOnUSSD"].toDouble(),
    averageMonthlySpendOnGambling: json["averageMonthlySpendOnGambling"],
    averageMonthlySpendOnAirtimeAndData: json["averageMonthlySpendOnAirtimeAndData"].toDouble(),
    averageMonthlySpendOnUtilities: json["averageMonthlySpendOnUtilities"],
    averageMonthlySpendOnOnlineAndWeb: json["averageMonthlySpendOnOnlineAndWeb"],
    averageMonthlySpendOnTransportation: json["averageMonthlySpendOnTransportation"],
    averageMonthlySpendOnHealth: json["averageMonthlySpendOnHealth"],
    averageMonthlySpendOnTravel: json["averageMonthlySpendOnTravel"],
    averageMonthlySpendOnEntertainment: json["averageMonthlySpendOnEntertainment"],
    averageMonthlySpendOnHospitalityAndFood: json["averageMonthlySpendOnHospitalityAndFood"],
    averageMonthlySpendOnRent: json["averageMonthlySpendOnRent"],
    averageMonthlySpendOnInsurance: json["averageMonthlySpendOnInsurance"],
    averageMonthlySpendOnChargesAndStampDuty: json["averageMonthlySpendOnChargesAndStampDuty"].toDouble(),
    averageMonthlySpendOnInternationalTransactions: json["averageMonthlySpendOnInternationalTransactions"],
    averageMonthlyTotalExpenses: json["averageMonthlyTotalExpenses"].toDouble(),
    averageMonthlyRecurringExpense: json["averageMonthlyRecurringExpense"],
    mostRecurringExpense: json["mostRecurringExpense"],
    totalSpendOnTransfer: json["totalSpendOnTransfer"].toDouble(),
    totalSpendOnAtmAndPos: json["totalSpendOnAtmAndPOS"],
    totalSpendOnUssd: json["totalSpendOnUSSD"].toDouble(),
    totalSpendOnGambling: json["totalSpendOnGambling"],
    totalSpendOnAirtimeAndData: json["totalSpendOnAirtimeAndData"],
    totalSpendOnUtilities: json["totalSpendOnUtilities"],
    totalSpendOnOnlineAndWeb: json["totalSpendOnOnlineAndWeb"],
    totalSpendOnTransportation: json["totalSpendOnTransportation"],
    totalSpendOnHealth: json["totalSpendOnHealth"],
    totalSpendOnTravel: json["totalSpendOnTravel"],
    totalSpendOnEntertainment: json["totalSpendOnEntertainment"],
    totalSpendOnHospitalityAndFood: json["totalSpendOnHospitalityAndFood"],
    totalSpendOnRent: json["totalSpendOnRent"],
    totalSpendOnInsurance: json["totalSpendOnInsurance"],
    totalSpendOnChargesAndStampDuty: json["totalSpendOnChargesAndStampDuty"].toDouble(),
    totalSpendOnInternationalTransactions: json["totalSpendOnInternationalTransactions"],
    totalMonthlyExpenses: json["totalMonthlyExpenses"].toDouble(),
    totalRecurringExpense: json["totalRecurringExpense"],
    totalExpenses: json["totalExpenses"],
    totalMonthlyExpense: json["totalMonthlyExpense"],
    atmLocations: json["atmLocations"],
  );

  Map<String, dynamic> toJson() => {
    "averageMonthlySpendOnTransfer": averageMonthlySpendOnTransfer,
    "averageMonthlySpendOnAtmAndPOS": averageMonthlySpendOnAtmAndPos,
    "averageMonthlySpendOnUSSD": averageMonthlySpendOnUssd,
    "averageMonthlySpendOnGambling": averageMonthlySpendOnGambling,
    "averageMonthlySpendOnAirtimeAndData": averageMonthlySpendOnAirtimeAndData,
    "averageMonthlySpendOnUtilities": averageMonthlySpendOnUtilities,
    "averageMonthlySpendOnOnlineAndWeb": averageMonthlySpendOnOnlineAndWeb,
    "averageMonthlySpendOnTransportation": averageMonthlySpendOnTransportation,
    "averageMonthlySpendOnHealth": averageMonthlySpendOnHealth,
    "averageMonthlySpendOnTravel": averageMonthlySpendOnTravel,
    "averageMonthlySpendOnEntertainment": averageMonthlySpendOnEntertainment,
    "averageMonthlySpendOnHospitalityAndFood": averageMonthlySpendOnHospitalityAndFood,
    "averageMonthlySpendOnRent": averageMonthlySpendOnRent,
    "averageMonthlySpendOnInsurance": averageMonthlySpendOnInsurance,
    "averageMonthlySpendOnChargesAndStampDuty": averageMonthlySpendOnChargesAndStampDuty,
    "averageMonthlySpendOnInternationalTransactions": averageMonthlySpendOnInternationalTransactions,
    "averageMonthlyTotalExpenses": averageMonthlyTotalExpenses,
    "averageMonthlyRecurringExpense": averageMonthlyRecurringExpense,
    "mostRecurringExpense": mostRecurringExpense,
    "totalSpendOnTransfer": totalSpendOnTransfer,
    "totalSpendOnAtmAndPOS": totalSpendOnAtmAndPos,
    "totalSpendOnUSSD": totalSpendOnUssd,
    "totalSpendOnGambling": totalSpendOnGambling,
    "totalSpendOnAirtimeAndData": totalSpendOnAirtimeAndData,
    "totalSpendOnUtilities": totalSpendOnUtilities,
    "totalSpendOnOnlineAndWeb": totalSpendOnOnlineAndWeb,
    "totalSpendOnTransportation": totalSpendOnTransportation,
    "totalSpendOnHealth": totalSpendOnHealth,
    "totalSpendOnTravel": totalSpendOnTravel,
    "totalSpendOnEntertainment": totalSpendOnEntertainment,
    "totalSpendOnHospitalityAndFood": totalSpendOnHospitalityAndFood,
    "totalSpendOnRent": totalSpendOnRent,
    "totalSpendOnInsurance": totalSpendOnInsurance,
    "totalSpendOnChargesAndStampDuty": totalSpendOnChargesAndStampDuty,
    "totalSpendOnInternationalTransactions": totalSpendOnInternationalTransactions,
    "totalMonthlyExpenses": totalMonthlyExpenses,
    "totalRecurringExpense": totalRecurringExpense,
    "totalExpenses": totalExpenses,
    "totalMonthlyExpense": totalMonthlyExpense,
    "atmLocations": atmLocations,
  };
}

class TransactionPatternAnalysis {
  TransactionPatternAnalysis({
    this.lastDayOfCredit,
    this.lastDayOfDebit,
    this.percentDebitTransactions,
    this.percentCreditTransactions,
    this.totalNumberOfTransactions,
    this.percentOfTransactionsLessThan10ThousandNaira,
    this.percentOfTransactionsBetween10ThousandTo100ThousandNaira,
    this.percentOfTransactionsBetween100ThousandTo500ThousandNaira,
    this.percentOfTransactionsBetween500ThousandToOneMillionNaira,
    this.percentOfTransactionsGreaterThanOneMillionNaira,
    this.percentNumberOfDaysTransactionsWasLessThan10ThousandNaira,
    this.percentOfBalancesLessThan10ThousandNaira,
    this.percentOfBalancesBetween10ThousandTo100ThousandNaira,
    this.percentOfBalancesBetween100ThousandTo500ThousandNaira,
    this.percentOfBalancesBetween500ThousandToOneMillionNaira,
    this.percentOfBalancesGreaterThanOneMillionNaira,
    this.percentNumberOfDaysBalanceWasLessThan10ThousandNaira,
    this.mostFrequentBalanceRange,
    this.mostFrequentTransactionRange,
    this.numberOfCardRequests,
    this.topIncomingTransfer,
    this.mostFrequentCreditTransfer,
    this.mostFrequentDebitTransfer,
    this.topOutgoingTransfer,
  });

  DateTime? lastDayOfCredit;
  DateTime? lastDayOfDebit;
  double? percentDebitTransactions;
  double? percentCreditTransactions;
  int? totalNumberOfTransactions;
  double? percentOfTransactionsLessThan10ThousandNaira;
  double? percentOfTransactionsBetween10ThousandTo100ThousandNaira;
  double? percentOfTransactionsBetween100ThousandTo500ThousandNaira;
  double? percentOfTransactionsBetween500ThousandToOneMillionNaira;
  int? percentOfTransactionsGreaterThanOneMillionNaira;
  double? percentNumberOfDaysTransactionsWasLessThan10ThousandNaira;
  double? percentOfBalancesLessThan10ThousandNaira;
  double? percentOfBalancesBetween10ThousandTo100ThousandNaira;
  double? percentOfBalancesBetween100ThousandTo500ThousandNaira;
  double? percentOfBalancesBetween500ThousandToOneMillionNaira;
  int? percentOfBalancesGreaterThanOneMillionNaira;
  double? percentNumberOfDaysBalanceWasLessThan10ThousandNaira;
  String? mostFrequentBalanceRange;
  String? mostFrequentTransactionRange;
  int? numberOfCardRequests;
  dynamic? topIncomingTransfer;
  dynamic? mostFrequentCreditTransfer;
  dynamic? mostFrequentDebitTransfer;
  dynamic? topOutgoingTransfer;

  factory TransactionPatternAnalysis.fromJson(Map<String, dynamic> json) => TransactionPatternAnalysis(
    lastDayOfCredit: DateTime.parse(json["lastDayOfCredit"]),
    lastDayOfDebit: DateTime.parse(json["lastDayOfDebit"]),
    percentDebitTransactions: json["percentDebitTransactions"].toDouble(),
    percentCreditTransactions: json["percentCreditTransactions"].toDouble(),
    totalNumberOfTransactions: json["totalNumberOfTransactions"],
    percentOfTransactionsLessThan10ThousandNaira: json["percentOfTransactionsLessThan10ThousandNaira"].toDouble(),
    percentOfTransactionsBetween10ThousandTo100ThousandNaira: json["percentOfTransactionsBetween10ThousandTo100ThousandNaira"].toDouble(),
    percentOfTransactionsBetween100ThousandTo500ThousandNaira: json["percentOfTransactionsBetween100ThousandTo500ThousandNaira"].toDouble(),
    percentOfTransactionsBetween500ThousandToOneMillionNaira: json["percentOfTransactionsBetween500ThousandToOneMillionNaira"].toDouble(),
    percentOfTransactionsGreaterThanOneMillionNaira: json["percentOfTransactionsGreaterThanOneMillionNaira"],
    percentNumberOfDaysTransactionsWasLessThan10ThousandNaira: json["percentNumberOfDaysTransactionsWasLessThan10ThousandNaira"].toDouble(),
    percentOfBalancesLessThan10ThousandNaira: json["percentOfBalancesLessThan10ThousandNaira"].toDouble(),
    percentOfBalancesBetween10ThousandTo100ThousandNaira: json["percentOfBalancesBetween10ThousandTo100ThousandNaira"].toDouble(),
    percentOfBalancesBetween100ThousandTo500ThousandNaira: json["percentOfBalancesBetween100ThousandTo500ThousandNaira"].toDouble(),
    percentOfBalancesBetween500ThousandToOneMillionNaira: json["percentOfBalancesBetween500ThousandToOneMillionNaira"].toDouble(),
    percentOfBalancesGreaterThanOneMillionNaira: json["percentOfBalancesGreaterThanOneMillionNaira"],
    percentNumberOfDaysBalanceWasLessThan10ThousandNaira: json["percentNumberOfDaysBalanceWasLessThan10ThousandNaira"].toDouble(),
    mostFrequentBalanceRange: json["mostFrequentBalanceRange"],
    mostFrequentTransactionRange: json["mostFrequentTransactionRange"],
    numberOfCardRequests: json["numberOfCardRequests"],
    topIncomingTransfer: json["topIncomingTransfer"],
    mostFrequentCreditTransfer: json["mostFrequentCreditTransfer"],
    mostFrequentDebitTransfer: json["mostFrequentDebitTransfer"],
    topOutgoingTransfer: json["topOutgoingTransfer"],
  );

  Map<String, dynamic> toJson() => {
    "lastDayOfCredit": "${lastDayOfCredit?.year.toString().padLeft(4, '0')}-${lastDayOfCredit?.month.toString().padLeft(2, '0')}-${lastDayOfCredit?.day.toString().padLeft(2, '0')}",
    "lastDayOfDebit": "${lastDayOfDebit?.year.toString().padLeft(4, '0')}-${lastDayOfDebit?.month.toString().padLeft(2, '0')}-${lastDayOfDebit?.day.toString().padLeft(2, '0')}",
    "percentDebitTransactions": percentDebitTransactions,
    "percentCreditTransactions": percentCreditTransactions,
    "totalNumberOfTransactions": totalNumberOfTransactions,
    "percentOfTransactionsLessThan10ThousandNaira": percentOfTransactionsLessThan10ThousandNaira,
    "percentOfTransactionsBetween10ThousandTo100ThousandNaira": percentOfTransactionsBetween10ThousandTo100ThousandNaira,
    "percentOfTransactionsBetween100ThousandTo500ThousandNaira": percentOfTransactionsBetween100ThousandTo500ThousandNaira,
    "percentOfTransactionsBetween500ThousandToOneMillionNaira": percentOfTransactionsBetween500ThousandToOneMillionNaira,
    "percentOfTransactionsGreaterThanOneMillionNaira": percentOfTransactionsGreaterThanOneMillionNaira,
    "percentNumberOfDaysTransactionsWasLessThan10ThousandNaira": percentNumberOfDaysTransactionsWasLessThan10ThousandNaira,
    "percentOfBalancesLessThan10ThousandNaira": percentOfBalancesLessThan10ThousandNaira,
    "percentOfBalancesBetween10ThousandTo100ThousandNaira": percentOfBalancesBetween10ThousandTo100ThousandNaira,
    "percentOfBalancesBetween100ThousandTo500ThousandNaira": percentOfBalancesBetween100ThousandTo500ThousandNaira,
    "percentOfBalancesBetween500ThousandToOneMillionNaira": percentOfBalancesBetween500ThousandToOneMillionNaira,
    "percentOfBalancesGreaterThanOneMillionNaira": percentOfBalancesGreaterThanOneMillionNaira,
    "percentNumberOfDaysBalanceWasLessThan10ThousandNaira": percentNumberOfDaysBalanceWasLessThan10ThousandNaira,
    "mostFrequentBalanceRange": mostFrequentBalanceRange,
    "mostFrequentTransactionRange": mostFrequentTransactionRange,
    "numberOfCardRequests": numberOfCardRequests,
    "topIncomingTransfer": topIncomingTransfer,
    "mostFrequentCreditTransfer": mostFrequentCreditTransfer,
    "mostFrequentDebitTransfer": mostFrequentDebitTransfer,
    "topOutgoingTransfer": topOutgoingTransfer,
  };
}