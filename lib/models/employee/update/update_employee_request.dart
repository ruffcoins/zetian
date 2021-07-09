// To parse this JSON data, do
//
//     final updateEmployeeRequest = updateEmployeeRequestFromJson(jsonString);

import 'dart:convert';

UpdateEmployeeRequest updateEmployeeRequestFromJson(String str) =>
    UpdateEmployeeRequest.fromJson(json.decode(str));

String updateEmployeeRequestToJson(UpdateEmployeeRequest data) =>
    json.encode(data.toJson());

class UpdateEmployeeRequest {
  UpdateEmployeeRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.address,
    this.salary,
    this.bankName,
    this.accountNumber,
    this.accountName,
    this.comments,
  });

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? address;
  double? salary;
  String? bankName;
  String? accountNumber;
  String? accountName;
  String? comments;

  factory UpdateEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      UpdateEmployeeRequest(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        salary: json["salary"] == null ? null : json["salary"],
        bankName: json["bankName"] == null ? null : json["bankName"],
        accountNumber:
            json["accountNumber"] == null ? null : json["accountNumber"],
        accountName: json["accountName"] == null ? null : json["accountName"],
        comments: json["comments"] == null ? null : json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "salary": salary == null ? null : salary,
        "bankName": bankName == null ? null : bankName,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "accountName": accountName == null ? null : accountName,
        "comments": comments == null ? null : comments,
      };
}
