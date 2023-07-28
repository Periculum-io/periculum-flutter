import 'dart:convert';

List<SenderAddress> senderAddressFromJson(String str) => List<SenderAddress>.from(json.decode(str).map((x) => SenderAddress.fromJson(x)));

String senderAddressToJson(List<SenderAddress> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SenderAddress {
  String address;
  String name;

  SenderAddress({
    required this.address,
    required this.name,
  });

  factory SenderAddress.fromJson(Map<String, dynamic> json) => SenderAddress(
    address: json["address"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "name": name,
  };
}
