// To parse this JSON data, do
//
//     final getRecentExpenseResponse = getRecentExpenseResponseFromJson(jsonString);

import 'dart:convert';

GetRecentExpenseResponse getRecentExpenseResponseFromJson(String str) =>
    GetRecentExpenseResponse.fromJson(json.decode(str));

String getRecentExpenseResponseToJson(GetRecentExpenseResponse data) =>
    json.encode(data.toJson());

class GetRecentExpenseResponse {
  GetRecentExpenseResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<RecentExpenseResult> message;

  factory GetRecentExpenseResponse.fromJson(Map<String, dynamic> json) =>
      GetRecentExpenseResponse(
        success: json["success"],
        message: List<RecentExpenseResult>.from(
            json["message"].map((x) => RecentExpenseResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class RecentExpenseResult {
  RecentExpenseResult({
    required this.id,
    required this.expense,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.employeeId,
    required this.employeeName,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String expense;
  String purpose;
  int amount;
  DateTime date;
  String employeeId;
  String employeeName;
  DateTime createdAt;
  DateTime updatedAt;

  factory RecentExpenseResult.fromJson(Map<String, dynamic> json) =>
      RecentExpenseResult(
        id: json["_id"],
        expense: json["expense"],
        purpose: json["purpose"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "expense": expense,
        "purpose": purpose,
        "amount": amount,
        "date": date.toIso8601String(),
        "employee_id": employeeId,
        "employee_name": employeeName,
        "created_at": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
