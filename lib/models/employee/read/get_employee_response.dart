// To parse this JSON data, do
//
//     final getEmployeeResponse = getEmployeeResponseFromJson(jsonString);

import 'dart:convert';

GetEmployeeResponse getEmployeeResponseFromJson(String str) =>
    GetEmployeeResponse.fromJson(json.decode(str));

String getEmployeeResponseToJson(GetEmployeeResponse data) =>
    json.encode(data.toJson());

class GetEmployeeResponse {
  GetEmployeeResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<Message> message;

  factory GetEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      GetEmployeeResponse(
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
  Message(
      {required this.id,
      required this.firstName,
      required this.phoneNumber,
      required this.email,
      required this.lastName,
      required this.address,
      required this.salary,
      required this.bankName,
      required this.accountNumber,
      required this.accountName,
      required this.comments});

  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String address;
  int salary;
  String bankName;
  String accountNumber;
  String accountName;
  String comments;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
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
        "_id": id,
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
