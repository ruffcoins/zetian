// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

CreateExpenseResponse createExpenseResponseFromJson(String str) =>
    CreateExpenseResponse.fromJson(json.decode(str));

String createExpenseResponseToJson(CreateExpenseResponse data) =>
    json.encode(data.toJson());

class CreateExpenseResponse {
  CreateExpenseResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory CreateExpenseResponse.fromJson(Map<String, dynamic> json) =>
      CreateExpenseResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
