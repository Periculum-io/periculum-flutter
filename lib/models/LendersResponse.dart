class LendersResponse {
  LendersResponse({
    this.lenders,
  });

  List<Lender>? lenders;

  factory LendersResponse.fromJson(Map<String, dynamic> json) =>
      LendersResponse(
        lenders:
            List<Lender>.from(json["lenders"].map((x) => Lender.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lenders": List<dynamic>.from(lenders!.map((x) => x.toJson())),
      };
}

class Lender {
  Lender({
    this.key,
    this.lenderName,
    this.smsAddress,
  });

  int? key;
  String? lenderName;
  String? smsAddress;

  factory Lender.fromJson(Map<String, dynamic> json) => Lender(
        key: json["key"],
        lenderName: json["lenderName"],
        smsAddress: json["smsAddress"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "lenderName": lenderName,
        "smsAddress": smsAddress,
      };
}
