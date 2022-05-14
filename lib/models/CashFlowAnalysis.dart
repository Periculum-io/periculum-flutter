class CashFlowAnalysis {
  CashFlowAnalysis({
    required this.totalCreditTurnover,
    required this.totalDebitTurnOver,
    required this.averageMonthlyCredits,
    required this.averageMonthlyDebits,
    required this.averageWeeklyCredits,
    required this.averageWeeklyDebits,
    required this.averageMonthlyBalance,
    required this.averageWeeklyBalance,
    required this.numberOfTransactingMonths,
    required this.periodInStatement,
    required this.yearInStatement,
    required this.firstDateInStatement,
    required this.lastDateInStatement,
    required this.closingBalance,
  });

  num totalCreditTurnover;
  num totalDebitTurnOver;
  num averageMonthlyCredits;
  num averageMonthlyDebits;
  num averageWeeklyCredits;
  num averageWeeklyDebits;
  num averageMonthlyBalance;
  num averageWeeklyBalance;
  num numberOfTransactingMonths;
  String periodInStatement;
  String yearInStatement;
  DateTime firstDateInStatement;
  DateTime lastDateInStatement;
  num closingBalance;

  factory CashFlowAnalysis.fromJson(Map<String, dynamic> json) =>
      CashFlowAnalysis(
        totalCreditTurnover: json["totalCreditTurnover"],
        totalDebitTurnOver: json["totalDebitTurnOver"],
        averageMonthlyCredits: json["averageMonthlyCredits"],
        averageMonthlyDebits: json["averageMonthlyDebits"],
        averageWeeklyCredits: json["averageWeeklyCredits"],
        averageWeeklyDebits: json["averageWeeklyDebits"],
        averageMonthlyBalance: json["averageMonthlyBalance"],
        averageWeeklyBalance: json["averageWeeklyBalance"],
        numberOfTransactingMonths: json["numberOfTransactingMonths"],
        periodInStatement: json["periodInStatement"],
        yearInStatement: json["yearInStatement"],
        firstDateInStatement: DateTime.parse(json["firstDateInStatement"]),
        lastDateInStatement: DateTime.parse(json["lastDateInStatement"]),
        closingBalance: json["closingBalance"],
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
        "firstDateInStatement":
            "${firstDateInStatement.year.toString().padLeft(4, '0')}-${firstDateInStatement.month.toString().padLeft(2, '0')}-${firstDateInStatement.day.toString().padLeft(2, '0')}",
        "lastDateInStatement":
            "${lastDateInStatement.year.toString().padLeft(4, '0')}-${lastDateInStatement.month.toString().padLeft(2, '0')}-${lastDateInStatement.day.toString().padLeft(2, '0')}",
        "closingBalance": closingBalance,
      };
}
