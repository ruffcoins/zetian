// To parse this JSON data, do
//
//     final getDashboardResponse = getDashboardResponseFromJson(jsonString);

import 'dart:convert';

GetDashboardResponse getDashboardResponseFromJson(String str) =>
    GetDashboardResponse.fromJson(json.decode(str));

String getDashboardResponseToJson(GetDashboardResponse data) =>
    json.encode(data.toJson());

class GetDashboardResponse {
  GetDashboardResponse({
    required this.success,
    required this.message,
  });

  bool success;
  DashboardMessage message;

  factory GetDashboardResponse.fromJson(Map<String, dynamic> json) =>
      GetDashboardResponse(
        success: json["success"],
        message: DashboardMessage.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message.toJson(),
      };
}

class DashboardMessage {
  DashboardMessage({
    required this.serviceCount,
    required this.salesCount,
    required this.customersCount,
    required this.employeeCount,
  });

  int serviceCount;
  int salesCount;
  int customersCount;
  int employeeCount;

  factory DashboardMessage.fromJson(Map<String, dynamic> json) =>
      DashboardMessage(
        serviceCount: json["serviceCount"],
        salesCount: json["salesCount"],
        customersCount: json["customersCount"],
        employeeCount: json["employeeCount"],
      );

  Map<String, dynamic> toJson() => {
        "serviceCount": serviceCount,
        "salesCount": salesCount,
        "customersCount": customersCount,
        "employeeCount": employeeCount,
      };
}
