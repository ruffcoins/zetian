// To parse this JSON data, do
//
//     final createTenantResponse = createTenantResponseFromJson(jsonString);

import 'dart:convert';

UpdateServiceResponse updateServiceResponseFromJson(String str) =>
    UpdateServiceResponse.fromJson(json.decode(str));

String updateServiceResponseToJson(UpdateServiceResponse data) =>
    json.encode(data.toJson());

class UpdateServiceResponse {
  UpdateServiceResponse({
    required this.success,
    required this.result,
  });

  bool success;
  String result;

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) =>
      UpdateServiceResponse(
        success: json["success"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result,
      };
}
