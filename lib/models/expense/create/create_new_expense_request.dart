// To parse this JSON data, do
//
//     final createExpenseRequest = createExpenseRequestFromJson(jsonString);

import 'dart:convert';

CreateExpenseRequest createExpenseRequestFromJson(String str) =>
    CreateExpenseRequest.fromJson(json.decode(str));

String createExpenseRequestToJson(CreateExpenseRequest data) =>
    json.encode(data.toJson());

class CreateExpenseRequest {
  CreateExpenseRequest({
    required this.expense,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.employeeId,
  });

  String expense;
  String purpose;
  int amount;
  String date;
  String employeeId;

  factory CreateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      CreateExpenseRequest(
        expense: json["expense"],
        purpose: json["purpose"],
        amount: json["amount"],
        date: json["date"],
        employeeId: json["employee_id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "expense": expense,
        "purpose": purpose,
        "amount": amount,
        "date": date,
        "employee_id": employeeId,
      };
}
