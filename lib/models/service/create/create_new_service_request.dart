// To parse this JSON data, do
//
//     final createServiceRequest = createServiceRequestFromJson(jsonString);

import 'dart:convert';

CreateServiceRequest createServiceRequestFromJson(String str) =>
    CreateServiceRequest.fromJson(json.decode(str));

String createServiceRequestToJson(CreateServiceRequest data) =>
    json.encode(data.toJson());

class CreateServiceRequest {
  CreateServiceRequest({
    required this.name,
    required this.amount,
  });

  String name;
  double amount;

  factory CreateServiceRequest.fromJson(Map<String, dynamic> json) =>
      CreateServiceRequest(
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
      };
}
