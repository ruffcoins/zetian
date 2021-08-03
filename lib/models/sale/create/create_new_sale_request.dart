// To parse this JSON data, do
//
//     final createSaleRequest = createSaleRequestFromJson(jsonString);

import 'dart:convert';

CreateSaleRequest createSaleRequestFromJson(String str) =>
    CreateSaleRequest.fromJson(json.decode(str));

String createSaleRequestToJson(CreateSaleRequest data) =>
    json.encode(data.toJson());

class CreateSaleRequest {
  CreateSaleRequest({
    required this.carRegNo,
    required this.services,
    required this.employeeId,
    required this.date,
  });

  String carRegNo;
  List<String> services;
  String employeeId;
  String date;

  factory CreateSaleRequest.fromJson(Map<String, dynamic> json) =>
      CreateSaleRequest(
        carRegNo: json["carRegNo"],
        services: List<String>.from(json["services"].map((x) => x)),
        employeeId: json["employee_id"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "carRegNo": carRegNo,
        "services": List<dynamic>.from(services.map((x) => x)),
        "employee_id": employeeId,
        "date": date,
      };
}
