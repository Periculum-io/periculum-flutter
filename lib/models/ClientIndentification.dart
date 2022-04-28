class ClientIdentification {
  ClientIdentification({
    required this.identifierName,
    required this.identifierValue,
  });

  String identifierName;
  dynamic identifierValue;

  factory ClientIdentification.fromJson(Map<String, dynamic> json) =>
      ClientIdentification(
        identifierName: json["identifierName"],
        identifierValue: json["identifierValue"],
      );

  Map<String, dynamic> toJson() => {
        "identifierName": identifierName,
        "identifierValue": identifierValue,
      };
}
