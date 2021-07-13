// To parse this JSON data, do
//
//     final getExpenseResponse = getExpenseResponseFromJson(jsonString);

import 'dart:convert';

GetExpenseResponse getExpenseResponseFromJson(String str) =>
    GetExpenseResponse.fromJson(json.decode(str));

String getExpenseResponseToJson(GetExpenseResponse data) =>
    json.encode(data.toJson());

class GetExpenseResponse {
  GetExpenseResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<Message> message;

  factory GetExpenseResponse.fromJson(Map<String, dynamic> json) =>
      GetExpenseResponse(
        success: json["success"],
        message:
            List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.id,
    required this.expense,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.employeeId,
    required this.employeeName,
  });

  String id;
  String expense;
  String purpose;
  int amount;
  DateTime date;
  String employeeId;
  String employeeName;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        expense: json["expense"],
        purpose: json["purpose"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "expense": expense,
        "purpose": purpose,
        "amount": amount,
        "date": date.toIso8601String(),
        "employee_id": employeeId,
        "employee_name": employeeName,
      };
}
