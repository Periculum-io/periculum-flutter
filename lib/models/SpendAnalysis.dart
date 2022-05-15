class SpendAnalysis {
  SpendAnalysis({
    required this.averageMonthlySpendOnTransfer,
    required this.averageMonthlySpendOnAtmAndPos,
    required this.averageMonthlySpendOnUssd,
    required this.averageMonthlySpendOnGambling,
    required this.averageMonthlySpendOnAirtimeAndData,
    required this.averageMonthlySpendOnUtilities,
    required this.averageMonthlySpendOnOnlineAndWeb,
    required this.averageMonthlySpendOnTransportation,
    required this.averageMonthlySpendOnHealth,
    required this.averageMonthlySpendOnTravel,
    required this.averageMonthlySpendOnEntertainment,
    required this.averageMonthlySpendOnHospitalityAndFood,
    required this.averageMonthlySpendOnRent,
    required this.averageMonthlySpendOnInsurance,
    required this.averageMonthlySpendOnChargesAndStampDuty,
    required this.averageMonthlySpendOnInternationalTransactions,
    required this.averageMonthlyTotalExpenses,
    required this.averageMonthlyRecurringExpense,
    required this.averageMonthlySpendOnSavingsAndInvestments,
    required this.averageMonthlySpendOnOthers,
    required this.mostRecurringExpense,
    required this.totalSpendOnTransfer,
    required this.totalSpendOnAtmAndPos,
    required this.totalSpendOnUssd,
    required this.totalSpendOnGambling,
    required this.totalSpendOnAirtimeAndData,
    required this.totalSpendOnUtilities,
    required this.totalSpendOnOnlineAndWeb,
    required this.totalSpendOnTransportation,
    required this.totalSpendOnHealth,
    required this.totalSpendOnTravel,
    required this.totalSpendOnEntertainment,
    required this.totalSpendOnHospitalityAndFood,
    required this.totalSpendOnRent,
    required this.totalSpendOnInsurance,
    required this.totalSpendOnChargesAndStampDuty,
    required this.totalSpendOnInternationalTransactions,
    required this.totalMonthlyExpenses,
    required this.totalRecurringExpense,
    required this.totalExpenses,
    required this.totalMonthlyExpense,
    required this.totalSpendOnSavingsAndInvestments,
    required this.totalSpendOnOthers,
    required this.atmLocations,
    required this.mostFrequentSpendCategory,
    required this.monthWithHighestSpend,
    required this.highestSpend,
    required this.mostFrequentExpense,
    required this.mostFrequentExpenseAmount,
  });

  num? averageMonthlySpendOnTransfer;
  num? averageMonthlySpendOnAtmAndPos;
  num? averageMonthlySpendOnUssd;
  num? averageMonthlySpendOnGambling;
  num? averageMonthlySpendOnAirtimeAndData;
  num? averageMonthlySpendOnUtilities;
  num? averageMonthlySpendOnOnlineAndWeb;
  num? averageMonthlySpendOnTransportation;
  num? averageMonthlySpendOnHealth;
  num? averageMonthlySpendOnTravel;
  num? averageMonthlySpendOnEntertainment;
  num? averageMonthlySpendOnHospitalityAndFood;
  num? averageMonthlySpendOnRent;
  num? averageMonthlySpendOnInsurance;
  num? averageMonthlySpendOnChargesAndStampDuty;
  num? averageMonthlySpendOnInternationalTransactions;
  num? averageMonthlyTotalExpenses;
  num? averageMonthlyRecurringExpense;
  num? averageMonthlySpendOnSavingsAndInvestments;
  num? averageMonthlySpendOnOthers;
  String? mostRecurringExpense;
  num? totalSpendOnTransfer;
  num? totalSpendOnAtmAndPos;
  num? totalSpendOnUssd;
  num? totalSpendOnGambling;
  num? totalSpendOnAirtimeAndData;
  num? totalSpendOnUtilities;
  num? totalSpendOnOnlineAndWeb;
  num? totalSpendOnTransportation;
  num? totalSpendOnHealth;
  num? totalSpendOnTravel;
  num? totalSpendOnEntertainment;
  num? totalSpendOnHospitalityAndFood;
  num? totalSpendOnRent;
  num? totalSpendOnInsurance;
  num? totalSpendOnChargesAndStampDuty;
  num? totalSpendOnInternationalTransactions;
  num? totalMonthlyExpenses;
  num? totalRecurringExpense;
  num? totalExpenses;
  num? totalMonthlyExpense;
  num? totalSpendOnSavingsAndInvestments;
  num? totalSpendOnOthers;
  List<String>? atmLocations;
  String? mostFrequentSpendCategory;
  String? monthWithHighestSpend;
  num? highestSpend;
  String? mostFrequentExpense;
  num? mostFrequentExpenseAmount;

  factory SpendAnalysis.fromJson(Map<String, dynamic> json) => SpendAnalysis(
        averageMonthlySpendOnTransfer: json["averageMonthlySpendOnTransfer"],
        averageMonthlySpendOnAtmAndPos: json["averageMonthlySpendOnAtmAndPOS"],
        averageMonthlySpendOnUssd: json["averageMonthlySpendOnUSSD"],
        averageMonthlySpendOnGambling: json["averageMonthlySpendOnGambling"],
        averageMonthlySpendOnAirtimeAndData:
            json["averageMonthlySpendOnAirtimeAndData"],
        averageMonthlySpendOnUtilities: json["averageMonthlySpendOnUtilities"],
        averageMonthlySpendOnOnlineAndWeb:
            json["averageMonthlySpendOnOnlineAndWeb"],
        averageMonthlySpendOnTransportation:
            json["averageMonthlySpendOnTransportation"],
        averageMonthlySpendOnHealth: json["averageMonthlySpendOnHealth"],
        averageMonthlySpendOnTravel: json["averageMonthlySpendOnTravel"],
        averageMonthlySpendOnEntertainment:
            json["averageMonthlySpendOnEntertainment"],
        averageMonthlySpendOnHospitalityAndFood:
            json["averageMonthlySpendOnHospitalityAndFood"],
        averageMonthlySpendOnRent: json["averageMonthlySpendOnRent"],
        averageMonthlySpendOnInsurance: json["averageMonthlySpendOnInsurance"],
        averageMonthlySpendOnChargesAndStampDuty:
            json["averageMonthlySpendOnChargesAndStampDuty"],
        averageMonthlySpendOnInternationalTransactions:
            json["averageMonthlySpendOnInternationalTransactions"],
        averageMonthlyTotalExpenses: json["averageMonthlyTotalExpenses"],
        averageMonthlyRecurringExpense: json["averageMonthlyRecurringExpense"],
        averageMonthlySpendOnSavingsAndInvestments:
            json["averageMonthlySpendOnSavingsAndInvestments"],
        averageMonthlySpendOnOthers: json["averageMonthlySpendOnOthers"],
        mostRecurringExpense: json["mostRecurringExpense"],
        totalSpendOnTransfer: json["totalSpendOnTransfer"],
        totalSpendOnAtmAndPos: json["totalSpendOnAtmAndPOS"],
        totalSpendOnUssd: json["totalSpendOnUSSD"],
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
        totalSpendOnChargesAndStampDuty:
            json["totalSpendOnChargesAndStampDuty"],
        totalSpendOnInternationalTransactions:
            json["totalSpendOnInternationalTransactions"],
        totalMonthlyExpenses: json["totalMonthlyExpenses"],
        totalRecurringExpense: json["totalRecurringExpense"],
        totalExpenses: json["totalExpenses"],
        totalMonthlyExpense: json["totalMonthlyExpense"],
        totalSpendOnSavingsAndInvestments:
            json["totalSpendOnSavingsAndInvestments"],
        totalSpendOnOthers: json["totalSpendOnOthers"],
        atmLocations: List<String>.from(json["atmLocations"].map((x) => x)),
        mostFrequentSpendCategory: json["mostFrequentSpendCategory"],
        monthWithHighestSpend: json["monthWithHighestSpend"],
        highestSpend: json["highestSpend"],
        mostFrequentExpense: json["mostFrequentExpense"],
        mostFrequentExpenseAmount: json["mostFrequentExpenseAmount"],
      );

  Map<String, dynamic> toJson() => {
        "averageMonthlySpendOnTransfer": averageMonthlySpendOnTransfer,
        "averageMonthlySpendOnAtmAndPOS": averageMonthlySpendOnAtmAndPos,
        "averageMonthlySpendOnUSSD": averageMonthlySpendOnUssd,
        "averageMonthlySpendOnGambling": averageMonthlySpendOnGambling,
        "averageMonthlySpendOnAirtimeAndData":
            averageMonthlySpendOnAirtimeAndData,
        "averageMonthlySpendOnUtilities": averageMonthlySpendOnUtilities,
        "averageMonthlySpendOnOnlineAndWeb": averageMonthlySpendOnOnlineAndWeb,
        "averageMonthlySpendOnTransportation":
            averageMonthlySpendOnTransportation,
        "averageMonthlySpendOnHealth": averageMonthlySpendOnHealth,
        "averageMonthlySpendOnTravel": averageMonthlySpendOnTravel,
        "averageMonthlySpendOnEntertainment":
            averageMonthlySpendOnEntertainment,
        "averageMonthlySpendOnHospitalityAndFood":
            averageMonthlySpendOnHospitalityAndFood,
        "averageMonthlySpendOnRent": averageMonthlySpendOnRent,
        "averageMonthlySpendOnInsurance": averageMonthlySpendOnInsurance,
        "averageMonthlySpendOnChargesAndStampDuty":
            averageMonthlySpendOnChargesAndStampDuty,
        "averageMonthlySpendOnInternationalTransactions":
            averageMonthlySpendOnInternationalTransactions,
        "averageMonthlyTotalExpenses": averageMonthlyTotalExpenses,
        "averageMonthlyRecurringExpense": averageMonthlyRecurringExpense,
        "averageMonthlySpendOnSavingsAndInvestments":
            averageMonthlySpendOnSavingsAndInvestments,
        "averageMonthlySpendOnOthers": averageMonthlySpendOnOthers,
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
        "totalSpendOnInternationalTransactions":
            totalSpendOnInternationalTransactions,
        "totalMonthlyExpenses": totalMonthlyExpenses,
        "totalRecurringExpense": totalRecurringExpense,
        "totalExpenses": totalExpenses,
        "totalMonthlyExpense": totalMonthlyExpense,
        "totalSpendOnSavingsAndInvestments": totalSpendOnSavingsAndInvestments,
        "totalSpendOnOthers": totalSpendOnOthers,
        "atmLocations": List<dynamic>.from(atmLocations!.map((x) => x)),
        "mostFrequentSpendCategory": mostFrequentSpendCategory,
        "monthWithHighestSpend": monthWithHighestSpend,
        "highestSpend": highestSpend,
        "mostFrequentExpense": mostFrequentExpense,
        "mostFrequentExpenseAmount": mostFrequentExpenseAmount,
      };
}
