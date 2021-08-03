// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

UpdateCustomerResponse updateCustomerResponseFromJson(String str) =>
    UpdateCustomerResponse.fromJson(json.decode(str));

String updateCustomerResponseToJson(UpdateCustomerResponse data) =>
    json.encode(data.toJson());

class UpdateCustomerResponse {
  UpdateCustomerResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory UpdateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      UpdateCustomerResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
