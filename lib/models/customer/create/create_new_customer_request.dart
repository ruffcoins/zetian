// To parse this JSON data, do
//
//     final createCustomerRequest = createCustomerRequestFromJson(jsonString);

import 'dart:convert';

CreateCustomerRequest createCustomerRequestFromJson(String str) =>
    CreateCustomerRequest.fromJson(json.decode(str));

String createCustomerRequestToJson(CreateCustomerRequest data) =>
    json.encode(data.toJson());

class CreateCustomerRequest {
  CreateCustomerRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    required this.carRegNo,
    this.carMake,
    this.carModel,
  });

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String carRegNo;
  String? carMake;
  String? carModel;

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      CreateCustomerRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        carRegNo: json["carRegNo"],
        carMake: json["carMake"],
        carModel: json["carModel"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "carRegNo": carRegNo,
        "carMake": carMake,
        "carModel": carModel,
      };
}
