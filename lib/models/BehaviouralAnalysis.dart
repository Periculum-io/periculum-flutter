// ignore: file_names
class BehavioralAnalysis {
  BehavioralAnalysis({
    required this.monthToMonthInflowToOutflowRate,
    required this.overallInflowToOutflowRate,
    required this.totalLoanAmount,
    required this.totalLoanRepaymentAmount,
    required this.loanInflowRate,
    required this.loanRepaymentToInflowRate,
    required this.numberOfCreditLoanTransactions,
    required this.numberOfDebitRepaymentTransactions,
    required this.gamblingStatus,
    required this.gamblingRate,
    required this.accountActivity,
    required this.percentOfInflowIrregularity,
    required this.averageMonthlyLoanAmount,
    required this.averageMonthlyLoanRepaymentAmount,
    required this.accountSweep,
  });

  String monthToMonthInflowToOutflowRate;
  String overallInflowToOutflowRate;
  num totalLoanAmount;
  num totalLoanRepaymentAmount;
  num loanInflowRate;
  num loanRepaymentToInflowRate;
  num numberOfCreditLoanTransactions;
  num numberOfDebitRepaymentTransactions;
  String gamblingStatus;
  num gamblingRate;
  num accountActivity;
  num percentOfInflowIrregularity;
  num averageMonthlyLoanAmount;
  num averageMonthlyLoanRepaymentAmount;
  String accountSweep;

  factory BehavioralAnalysis.fromJson(Map<String, dynamic> json) =>
      BehavioralAnalysis(
        monthToMonthInflowToOutflowRate:
            json["monthToMonthInflowToOutflowRate"],
        overallInflowToOutflowRate: json["overallInflowToOutflowRate"],
        totalLoanAmount: json["totalLoanAmount"],
        totalLoanRepaymentAmount: json["totalLoanRepaymentAmount"].toDouble(),
        loanInflowRate: json["loanInflowRate"].toDouble(),
        loanRepaymentToInflowRate: json["loanRepaymentToInflowRate"].toDouble(),
        numberOfCreditLoanTransactions: json["numberOfCreditLoanTransactions"],
        numberOfDebitRepaymentTransactions:
            json["numberOfDebitRepaymentTransactions"],
        gamblingStatus: json["gamblingStatus"],
        gamblingRate: json["gamblingRate"],
        accountActivity: json["accountActivity"].toDouble(),
        percentOfInflowIrregularity:
            json["percentOfInflowIrregularity"].toDouble(),
        averageMonthlyLoanAmount: json["averageMonthlyLoanAmount"],
        averageMonthlyLoanRepaymentAmount:
            json["averageMonthlyLoanRepaymentAmount"].toDouble(),
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
        "numberOfDebitRepaymentTransactions":
            numberOfDebitRepaymentTransactions,
        "gamblingStatus": gamblingStatus,
        "gamblingRate": gamblingRate,
        "accountActivity": accountActivity,
        "percentOfInflowIrregularity": percentOfInflowIrregularity,
        "averageMonthlyLoanAmount": averageMonthlyLoanAmount,
        "averageMonthlyLoanRepaymentAmount": averageMonthlyLoanRepaymentAmount,
        "accountSweep": accountSweep,
      };
}
