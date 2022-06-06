import 'dart:convert';

InsightsResponse insightsResponseFromJson(String str) =>
    InsightsResponse.fromJson(json.decode(str));

String insightsResponseToJson(InsightsResponse data) =>
    json.encode(data.toJson());

class InsightsResponse {
  InsightsResponse({
    this.insightsKey,
    this.accountKey,
    this.senderKey,
    this.averagePredictedSalary,
    this.lastDateOfSalaryPayment,
    this.totalTransactionsAnalyzed,
    this.numberOfCardRequests,
    this.returnCheque,
    this.totalLoanAmount,
    this.totalLoanRepaymentAmount,
    this.numberOfCreditLoanTransactions,
    this.numberOfDebitRepaymentTransactions,
    this.gamblingRate,
    this.accountActivity,
    this.averageMonthlyLoanAmount,
    this.averageMonthlyLoanRepaymentAmount,
    this.totalCreditTurnover,
    this.totalDebitTurnover,
    this.firstDate,
    this.lastDate,
    this.closingBalance,
    this.averageMonthlySpendOnGambling,
    this.totalSpendOnGambling,
    this.atmLocations,
  });

  int? insightsKey;
  int? accountKey;
  int? senderKey;
  double? averagePredictedSalary;
  String? lastDateOfSalaryPayment;
  int? totalTransactionsAnalyzed;
  int? numberOfCardRequests;
  int? returnCheque;
  int? totalLoanAmount;
  int? totalLoanRepaymentAmount;
  dynamic numberOfCreditLoanTransactions;
  dynamic numberOfDebitRepaymentTransactions;
  int? gamblingRate;
  double? accountActivity;
  int? averageMonthlyLoanAmount;
  int? averageMonthlyLoanRepaymentAmount;
  double? totalCreditTurnover;
  double? totalDebitTurnover;
  DateTime? firstDate;
  DateTime? lastDate;
  double? closingBalance;
  int? averageMonthlySpendOnGambling;
  int? totalSpendOnGambling;
  List<dynamic>? atmLocations;

  factory InsightsResponse.fromJson(Map<String, dynamic> json) =>
      InsightsResponse(
        insightsKey: json["insightsKey"],
        accountKey: json["accountKey"],
        senderKey: json["senderKey"],
        averagePredictedSalary: json["averagePredictedSalary"].toDouble(),
        lastDateOfSalaryPayment: json["lastDateOfSalaryPayment"],
        totalTransactionsAnalyzed: json["totalTransactionsAnalyzed"],
        numberOfCardRequests: json["numberOfCardRequests"],
        returnCheque: json["returnCheque"],
        totalLoanAmount: json["totalLoanAmount"],
        totalLoanRepaymentAmount: json["totalLoanRepaymentAmount"],
        numberOfCreditLoanTransactions: json["numberOfCreditLoanTransactions"],
        numberOfDebitRepaymentTransactions:
            json["numberOfDebitRepaymentTransactions"],
        gamblingRate: json["gamblingRate"],
        accountActivity: json["accountActivity"].toDouble(),
        averageMonthlyLoanAmount: json["averageMonthlyLoanAmount"],
        averageMonthlyLoanRepaymentAmount:
            json["averageMonthlyLoanRepaymentAmount"],
        totalCreditTurnover: json["totalCreditTurnover"].toDouble(),
        totalDebitTurnover: json["totalDebitTurnover"].toDouble(),
        firstDate: DateTime.parse(json["firstDate"]),
        lastDate: DateTime.parse(json["lastDate"]),
        closingBalance: json["closingBalance"].toDouble(),
        averageMonthlySpendOnGambling: json["averageMonthlySpendOnGambling"],
        totalSpendOnGambling: json["totalSpendOnGambling"],
        atmLocations: List<dynamic>.from(json["atmLocations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "insightsKey": insightsKey,
        "accountKey": accountKey,
        "senderKey": senderKey,
        "averagePredictedSalary": averagePredictedSalary,
        "lastDateOfSalaryPayment": lastDateOfSalaryPayment,
        "totalTransactionsAnalyzed": totalTransactionsAnalyzed,
        "numberOfCardRequests": numberOfCardRequests,
        "returnCheque": returnCheque,
        "totalLoanAmount": totalLoanAmount,
        "totalLoanRepaymentAmount": totalLoanRepaymentAmount,
        "numberOfCreditLoanTransactions": numberOfCreditLoanTransactions,
        "numberOfDebitRepaymentTransactions":
            numberOfDebitRepaymentTransactions,
        "gamblingRate": gamblingRate,
        "accountActivity": accountActivity,
        "averageMonthlyLoanAmount": averageMonthlyLoanAmount,
        "averageMonthlyLoanRepaymentAmount": averageMonthlyLoanRepaymentAmount,
        "totalCreditTurnover": totalCreditTurnover,
        "totalDebitTurnover": totalDebitTurnover,
        "firstDate":
            "${firstDate!.year.toString().padLeft(4, '0')}-${firstDate!.month.toString().padLeft(2, '0')}-${firstDate!.day.toString().padLeft(2, '0')}",
        "lastDate":
            "${lastDate!.year.toString().padLeft(4, '0')}-${lastDate!.month.toString().padLeft(2, '0')}-${lastDate!.day.toString().padLeft(2, '0')}",
        "closingBalance": closingBalance,
        "averageMonthlySpendOnGambling": averageMonthlySpendOnGambling,
        "totalSpendOnGambling": totalSpendOnGambling,
        "atmLocations": List<dynamic>.from(atmLocations!.map((x) => x)),
      };
}
