// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

CreateEmployeeResponse createEmployeeResponseFromJson(String str) =>
    CreateEmployeeResponse.fromJson(json.decode(str));

String createEmployeeResponseToJson(CreateEmployeeResponse data) =>
    json.encode(data.toJson());

class CreateEmployeeResponse {
  CreateEmployeeResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory CreateEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      CreateEmployeeResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
