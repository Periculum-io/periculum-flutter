import 'dart:convert';

CreditScoreResponse creditScoreResponseFromJson(String str) =>
    CreditScoreResponse.fromJson(json.decode(str));

String creditScoreResponseToJson(CreditScoreResponse data) =>
    json.encode(data.toJson());

class CreditScoreResponse {
  CreditScoreResponse({
    required this.rulesScore,
    required this.baseScore,
    required this.calculatedScore,
    required this.didPass,
    required this.passReasons,
    required this.failReasons,
    required this.type,
  });

  int rulesScore;
  int baseScore;
  int calculatedScore;
  dynamic didPass;
  List<String> passReasons;
  List<String> failReasons;
  String type;

  factory CreditScoreResponse.fromJson(Map<String, dynamic> json) =>
      CreditScoreResponse(
        rulesScore: json["rulesScore"],
        baseScore: json["baseScore"],
        calculatedScore: json["calculatedScore"],
        didPass: json["didPass"],
        passReasons: List<String>.from(json["passReasons"].map((x) => x)),
        failReasons: List<String>.from(json["failReasons"].map((x) => x)),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "rulesScore": rulesScore,
        "baseScore": baseScore,
        "calculatedScore": calculatedScore,
        "didPass": didPass,
        "passReasons": List<dynamic>.from(passReasons.map((x) => x)),
        "failReasons": List<dynamic>.from(failReasons.map((x) => x)),
        "type": type,
      };
}
