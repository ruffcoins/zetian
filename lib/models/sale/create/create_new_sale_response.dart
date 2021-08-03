// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

CreateSaleResponse createSaleResponseFromJson(String str) =>
    CreateSaleResponse.fromJson(json.decode(str));

String createSaleResponseToJson(CreateSaleResponse data) =>
    json.encode(data.toJson());

class CreateSaleResponse {
  CreateSaleResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory CreateSaleResponse.fromJson(Map<String, dynamic> json) =>
      CreateSaleResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
