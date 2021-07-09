// To parse this JSON data, do
//
//     final updateServiceRequest = updateServiceRequestFromJson(jsonString);

import 'dart:convert';

UpdateServiceRequest updateServiceRequestFromJson(String str) =>
    UpdateServiceRequest.fromJson(json.decode(str));

String updateServiceRequestToJson(UpdateServiceRequest data) =>
    json.encode(data.toJson());

class UpdateServiceRequest {
  UpdateServiceRequest({
    this.name,
    this.amount,
  });

  String? name;
  double? amount;

  factory UpdateServiceRequest.fromJson(Map<String, dynamic> json) =>
      UpdateServiceRequest(
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
      };
}
