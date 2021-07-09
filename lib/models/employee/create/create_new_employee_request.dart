// To parse this JSON data, do
//
//     final createEmployeeRequest = createEmployeeRequestFromJson(jsonString);

import 'dart:convert';

CreateEmployeeRequest createEmployeeRequestFromJson(String str) =>
    CreateEmployeeRequest.fromJson(json.decode(str));

String createEmployeeRequestToJson(CreateEmployeeRequest data) =>
    json.encode(data.toJson());

class CreateEmployeeRequest {
  CreateEmployeeRequest({
    required this.firstName,
    this.lastName,
    required this.phoneNumber,
    this.email,
    this.address,
    this.salary,
    this.bankName,
    this.accountNumber,
    this.accountName,
    this.comments,
  });

  String firstName;
  String? lastName;
  String phoneNumber;
  String? email;
  String? address;
  double? salary;
  String? bankName;
  String? accountNumber;
  String? accountName;
  String? comments;

  factory CreateEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      CreateEmployeeRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"],
        salary: json["salary"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
        "salary": salary,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "comments": comments,
      };
}
