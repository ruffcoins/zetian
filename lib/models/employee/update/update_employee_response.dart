// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

UpdateEmployeeResponse updateEmployeeResponseFromJson(String str) =>
    UpdateEmployeeResponse.fromJson(json.decode(str));

String updateEmployeeResponseToJson(UpdateEmployeeResponse data) =>
    json.encode(data.toJson());

class UpdateEmployeeResponse {
  UpdateEmployeeResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory UpdateEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      UpdateEmployeeResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
