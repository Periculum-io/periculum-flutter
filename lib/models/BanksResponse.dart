class BankResponse {
  BankResponse({
    this.banks,
  });

  List<Bank>? banks;

  factory BankResponse.fromJson(Map<String, dynamic> json) => BankResponse(
        banks: List<Bank>.from(json["banks"].map((x) => Bank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banks": List<dynamic>.from(banks!.map((x) => x.toJson())),
      };
}

class Bank {
  Bank({
    this.key,
    this.bankName,
    this.smsAddress,
    this.accounts,
  });

  int? key;
  String? bankName;
  String? smsAddress;
  List<Account>? accounts;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        key: json["key"],
        bankName: json["bankName"],
        smsAddress: json["smsAddress"],
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "bankName": bankName,
        "smsAddress": smsAddress,
        "accounts": List<dynamic>.from(accounts!.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    this.key,
    this.accountNumber,
    this.accountName,
    this.insights,
  });

  int? key;
  String? accountNumber;
  String? accountName;
  dynamic insights;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        key: json["key"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        insights: json["insights"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "insights": insights,
      };
}
