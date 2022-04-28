import 'dart:convert';

AffordabilityResponse affordabilityResponseFromJson(String str) =>
    AffordabilityResponse.fromJson(json.decode(str));

String affordabilityResponseToJson(AffordabilityResponse data) =>
    json.encode(data.toJson());

class AffordabilityResponse {
  AffordabilityResponse({
    this.monthlyDisposableIncomeMonthlyAffordabilityAmount,
    this.affordabilityAmount,
    this.dti,
    this.loanTenure,
    this.averageMonthlyTotalExpenses,
    this.averageMonthlyLoanRepaymentAmount,
  });

  num? monthlyDisposableIncomeMonthlyAffordabilityAmount;
  num? affordabilityAmount;
  num? dti;
  num? loanTenure;
  num? averageMonthlyTotalExpenses;
  num? averageMonthlyLoanRepaymentAmount;

  factory AffordabilityResponse.fromJson(Map<String, dynamic> json) =>
      AffordabilityResponse(
        monthlyDisposableIncomeMonthlyAffordabilityAmount:
            json["monthly_disposable_income_monthly_affordability_amount"],
        affordabilityAmount: json["affordability_amount"],
        dti: json["dti"].toDouble(),
        loanTenure: json["loanTenure"],
        averageMonthlyTotalExpenses:
            json["average_monthly_total_expenses"].toDouble(),
        averageMonthlyLoanRepaymentAmount:
            json["average_monthly_loan_repayment_amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "monthly_disposable_income_monthly_affordability_amount":
            monthlyDisposableIncomeMonthlyAffordabilityAmount,
        "affordability_amount": affordabilityAmount,
        "dti": dti,
        "loanTenure": loanTenure,
        "average_monthly_total_expenses": averageMonthlyTotalExpenses,
        "average_monthly_loan_repayment_amount":
            averageMonthlyLoanRepaymentAmount,
      };
}
