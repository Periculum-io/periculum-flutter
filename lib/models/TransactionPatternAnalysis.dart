import 'Breakdown.dart';

class TransactionPatternAnalysis {
  TransactionPatternAnalysis({
    required this.lastDayOfCredit,
    required this.lastDayOfDebit,
    required this.percentDebitTransactions,
    required this.percentCreditTransactions,
    required this.totalNumberOfTransactions,
    required this.percentOfTransactionsLessThan10ThousandNaira,
    required this.percentOfTransactionsBetween10ThousandTo100ThousandNaira,
    required this.percentOfTransactionsBetween100ThousandTo500ThousandNaira,
    required this.percentOfTransactionsBetween500ThousandToOneMillionNaira,
    required this.percentOfTransactionsGreaterThanOneMillionNaira,
    required this.percentNumberOfDaysTransactionsWasLessThan10ThousandNaira,
    required this.percentOfBalancesLessThan10ThousandNaira,
    required this.percentOfBalancesBetween10ThousandTo100ThousandNaira,
    required this.percentOfBalancesBetween100ThousandTo500ThousandNaira,
    required this.percentOfBalancesBetween500ThousandToOneMillionNaira,
    required this.percentOfBalancesGreaterThanOneMillionNaira,
    required this.percentNumberOfDaysBalanceWasLessThan10ThousandNaira,
    required this.mostFrequentBalanceRange,
    required this.mostFrequentTransactionRange,
    required this.numberOfCardRequests,
    required this.topIncomingTransfer,
    required this.mostFrequentCreditTransfer,
    required this.mostFrequentDebitTransfer,
    required this.topOutgoingTransfer,
    required this.returnCheque,
    required this.balanceBreakdown,
    required this.transactionBreakdown,
    required this.percentNumberOfDaysTransactionsInSmallestBucket,
    required this.percentNumberOfDaysBalancesInSmallestBucket,
  });

  DateTime lastDayOfCredit;
  DateTime lastDayOfDebit;
  num percentDebitTransactions;
  num percentCreditTransactions;
  num totalNumberOfTransactions;
  num percentOfTransactionsLessThan10ThousandNaira;
  num percentOfTransactionsBetween10ThousandTo100ThousandNaira;
  num percentOfTransactionsBetween100ThousandTo500ThousandNaira;
  num percentOfTransactionsBetween500ThousandToOneMillionNaira;
  num percentOfTransactionsGreaterThanOneMillionNaira;
  num percentNumberOfDaysTransactionsWasLessThan10ThousandNaira;
  num percentOfBalancesLessThan10ThousandNaira;
  num percentOfBalancesBetween10ThousandTo100ThousandNaira;
  num percentOfBalancesBetween100ThousandTo500ThousandNaira;
  num percentOfBalancesBetween500ThousandToOneMillionNaira;
  num percentOfBalancesGreaterThanOneMillionNaira;
  num percentNumberOfDaysBalanceWasLessThan10ThousandNaira;
  String mostFrequentBalanceRange;
  String mostFrequentTransactionRange;
  num numberOfCardRequests;
  dynamic topIncomingTransfer;
  String mostFrequentCreditTransfer;
  String mostFrequentDebitTransfer;
  dynamic topOutgoingTransfer;
  num returnCheque;
  List<Breakdown> balanceBreakdown;
  List<Breakdown> transactionBreakdown;
  num percentNumberOfDaysTransactionsInSmallestBucket;
  num percentNumberOfDaysBalancesInSmallestBucket;

  factory TransactionPatternAnalysis.fromJson(Map<String, dynamic> json) =>
      TransactionPatternAnalysis(
        lastDayOfCredit: DateTime.parse(json["lastDayOfCredit"]),
        lastDayOfDebit: DateTime.parse(json["lastDayOfDebit"]),
        percentDebitTransactions: json["percentDebitTransactions"],
        percentCreditTransactions: json["percentCreditTransactions"],
        totalNumberOfTransactions: json["totalNumberOfTransactions"],
        percentOfTransactionsLessThan10ThousandNaira:
            json["percentOfTransactionsLessThan10ThousandNaira"],
        percentOfTransactionsBetween10ThousandTo100ThousandNaira:
            json["percentOfTransactionsBetween10ThousandTo100ThousandNaira"],
        percentOfTransactionsBetween100ThousandTo500ThousandNaira:
            json["percentOfTransactionsBetween100ThousandTo500ThousandNaira"],
        percentOfTransactionsBetween500ThousandToOneMillionNaira:
            json["percentOfTransactionsBetween500ThousandToOneMillionNaira"],
        percentOfTransactionsGreaterThanOneMillionNaira:
            json["percentOfTransactionsGreaterThanOneMillionNaira"],
        percentNumberOfDaysTransactionsWasLessThan10ThousandNaira:
            json["percentNumberOfDaysTransactionsWasLessThan10ThousandNaira"],
        percentOfBalancesLessThan10ThousandNaira:
            json["percentOfBalancesLessThan10ThousandNaira"],
        percentOfBalancesBetween10ThousandTo100ThousandNaira:
            json["percentOfBalancesBetween10ThousandTo100ThousandNaira"],
        percentOfBalancesBetween100ThousandTo500ThousandNaira:
            json["percentOfBalancesBetween100ThousandTo500ThousandNaira"],
        percentOfBalancesBetween500ThousandToOneMillionNaira:
            json["percentOfBalancesBetween500ThousandToOneMillionNaira"],
        percentOfBalancesGreaterThanOneMillionNaira:
            json["percentOfBalancesGreaterThanOneMillionNaira"],
        percentNumberOfDaysBalanceWasLessThan10ThousandNaira:
            json["percentNumberOfDaysBalanceWasLessThan10ThousandNaira"],
        mostFrequentBalanceRange: json["mostFrequentBalanceRange"],
        mostFrequentTransactionRange: json["mostFrequentTransactionRange"],
        numberOfCardRequests: json["numberOfCardRequests"],
        topIncomingTransfer: json["topIncomingTransfer"],
        mostFrequentCreditTransfer: json["mostFrequentCreditTransfer"],
        mostFrequentDebitTransfer: json["mostFrequentDebitTransfer"],
        topOutgoingTransfer: json["topOutgoingTransfer"],
        returnCheque: json["returnCheque"],
        balanceBreakdown: List<Breakdown>.from(
            json["balanceBreakdown"].map((x) => Breakdown.fromJson(x))),
        transactionBreakdown: List<Breakdown>.from(
            json["transactionBreakdown"].map((x) => Breakdown.fromJson(x))),
        percentNumberOfDaysTransactionsInSmallestBucket:
            json["percentNumberOfDaysTransactionsInSmallestBucket"],
        percentNumberOfDaysBalancesInSmallestBucket:
            json["percentNumberOfDaysBalancesInSmallestBucket"],
      );

  Map<String, dynamic> toJson() => {
        "lastDayOfCredit":
            "${lastDayOfCredit.year.toString().padLeft(4, '0')}-${lastDayOfCredit.month.toString().padLeft(2, '0')}-${lastDayOfCredit.day.toString().padLeft(2, '0')}",
        "lastDayOfDebit":
            "${lastDayOfDebit.year.toString().padLeft(4, '0')}-${lastDayOfDebit.month.toString().padLeft(2, '0')}-${lastDayOfDebit.day.toString().padLeft(2, '0')}",
        "percentDebitTransactions": percentDebitTransactions,
        "percentCreditTransactions": percentCreditTransactions,
        "totalNumberOfTransactions": totalNumberOfTransactions,
        "percentOfTransactionsLessThan10ThousandNaira":
            percentOfTransactionsLessThan10ThousandNaira,
        "percentOfTransactionsBetween10ThousandTo100ThousandNaira":
            percentOfTransactionsBetween10ThousandTo100ThousandNaira,
        "percentOfTransactionsBetween100ThousandTo500ThousandNaira":
            percentOfTransactionsBetween100ThousandTo500ThousandNaira,
        "percentOfTransactionsBetween500ThousandToOneMillionNaira":
            percentOfTransactionsBetween500ThousandToOneMillionNaira,
        "percentOfTransactionsGreaterThanOneMillionNaira":
            percentOfTransactionsGreaterThanOneMillionNaira,
        "percentNumberOfDaysTransactionsWasLessThan10ThousandNaira":
            percentNumberOfDaysTransactionsWasLessThan10ThousandNaira,
        "percentOfBalancesLessThan10ThousandNaira":
            percentOfBalancesLessThan10ThousandNaira,
        "percentOfBalancesBetween10ThousandTo100ThousandNaira":
            percentOfBalancesBetween10ThousandTo100ThousandNaira,
        "percentOfBalancesBetween100ThousandTo500ThousandNaira":
            percentOfBalancesBetween100ThousandTo500ThousandNaira,
        "percentOfBalancesBetween500ThousandToOneMillionNaira":
            percentOfBalancesBetween500ThousandToOneMillionNaira,
        "percentOfBalancesGreaterThanOneMillionNaira":
            percentOfBalancesGreaterThanOneMillionNaira,
        "percentNumberOfDaysBalanceWasLessThan10ThousandNaira":
            percentNumberOfDaysBalanceWasLessThan10ThousandNaira,
        "mostFrequentBalanceRange": mostFrequentBalanceRange,
        "mostFrequentTransactionRange": mostFrequentTransactionRange,
        "numberOfCardRequests": numberOfCardRequests,
        "topIncomingTransfer": topIncomingTransfer,
        "mostFrequentCreditTransfer": mostFrequentCreditTransfer,
        "mostFrequentDebitTransfer": mostFrequentDebitTransfer,
        "topOutgoingTransfer": topOutgoingTransfer,
        "returnCheque": returnCheque,
        "balanceBreakdown":
            List<dynamic>.from(balanceBreakdown.map((x) => x.toJson())),
        "transactionBreakdown":
            List<dynamic>.from(transactionBreakdown.map((x) => x.toJson())),
        "percentNumberOfDaysTransactionsInSmallestBucket":
            percentNumberOfDaysTransactionsInSmallestBucket,
        "percentNumberOfDaysBalancesInSmallestBucket":
            percentNumberOfDaysBalancesInSmallestBucket,
      };
}
