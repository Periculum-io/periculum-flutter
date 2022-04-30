import 'dart:convert';

AffordabilityResponse affordabilityResponseFromJson(String str) =>
    AffordabilityResponse.fromJson(json.decode(str));

String affordabilityResponseToJson(AffordabilityResponse data) =>
    json.encode(data.toJson());

class AffordabilityResponse {
  AffordabilityResponse({
    required this.statementKey,
    required this.dti,
    required this.loanTenure,
    required this.monthlyDisposableIncomeMonthlyAffordabilityAmount,
    required this.affordabilityAmount,
    required this.createdDate,
    required this.averagePredictedSalary,
    required this.averageOtherIncome,
    required this.averageMonthlyTotalExpenses,
    required this.averageMonthlyLoanRepaymentAmount,
  });

  num? statementKey;
  num? dti;
  num? loanTenure;
  num? monthlyDisposableIncomeMonthlyAffordabilityAmount;
  num? affordabilityAmount;
  String? createdDate;
  num? averagePredictedSalary;
  num? averageOtherIncome;
  num? averageMonthlyTotalExpenses;
  num? averageMonthlyLoanRepaymentAmount;

  factory AffordabilityResponse.fromJson(Map<String, dynamic> json) =>
      AffordabilityResponse(
        statementKey: json["statementKey"],
        dti: json["dti"],
        loanTenure: json["loanTenure"],
        monthlyDisposableIncomeMonthlyAffordabilityAmount:
            json["monthly_disposable_income/monthly_affordability_amount"],
        affordabilityAmount: json["affordability_amount"],
        createdDate: json["createdDate"],
        averagePredictedSalary: json["average_predicted_salary"],
        averageOtherIncome: json["average_other_income"],
        averageMonthlyTotalExpenses: json["average_monthly_total_expenses"],
        averageMonthlyLoanRepaymentAmount:
            json["average_monthly_loan_repayment_amount"],
      );

  Map<String, dynamic> toJson() => {
        "statementKey": statementKey,
        "dti": dti,
        "loanTenure": loanTenure,
        "monthly_disposable_income/monthly_affordability_amount":
            monthlyDisposableIncomeMonthlyAffordabilityAmount,
        "affordability_amount": affordabilityAmount,
        "createdDate": createdDate,
        "average_predicted_salary": averagePredictedSalary,
        "average_other_income": averageOtherIncome,
        "average_monthly_total_expenses": averageMonthlyTotalExpenses,
        "average_monthly_loan_repayment_amount":
            averageMonthlyLoanRepaymentAmount,
      };
}
