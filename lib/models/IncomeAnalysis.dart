class IncomeAnalysis {
  IncomeAnalysis({
    required this.averagePredictedSalary,
    required this.isSalaryEarner,
    required this.expectedSalaryPaymentDay,
    required this.frequencyOfSalaryPayments,
    required this.lastDateOfSalaryPayment,
    required this.numberOfSalaryPayments,
    required this.hasOtherIncome,
    required this.averageOtherIncome,
    required this.numberOfOtherIncomePayments,
    required this.netAverageMonthlyEarning,
    required this.lowestSalary,
    required this.mostRecentSalary,
  });

  num averagePredictedSalary;
  String isSalaryEarner;
  num expectedSalaryPaymentDay;
  String frequencyOfSalaryPayments;
  String lastDateOfSalaryPayment;
  num numberOfSalaryPayments;
  String hasOtherIncome;
  num averageOtherIncome;
  num numberOfOtherIncomePayments;
  num netAverageMonthlyEarning;
  num lowestSalary;
  String mostRecentSalary;

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
        lowestSalary: json["lowestSalary"],
        mostRecentSalary: json["mostRecentSalary"],
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
        "lowestSalary": lowestSalary,
        "mostRecentSalary": mostRecentSalary,
      };
}
