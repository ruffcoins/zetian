// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

CreateServiceResponse createServiceResponseFromJson(String str) =>
    CreateServiceResponse.fromJson(json.decode(str));

String createEmployeeResponseToJson(CreateServiceResponse data) =>
    json.encode(data.toJson());

class CreateServiceResponse {
  CreateServiceResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) =>
      CreateServiceResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
