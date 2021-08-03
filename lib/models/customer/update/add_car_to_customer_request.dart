// To parse this JSON data, do
//
//     final addCarToCustomerRequest = addCarToCustomerRequestFromJson(jsonString);

import 'dart:convert';

AddCarToCustomerRequest addCarToCustomerRequestFromJson(String str) =>
    AddCarToCustomerRequest.fromJson(json.decode(str));

String addCarToCustomerRequestToJson(AddCarToCustomerRequest data) =>
    json.encode(data.toJson());

class AddCarToCustomerRequest {
  AddCarToCustomerRequest({
    required this.carRegNo,
    this.carModel,
    this.carMake,
  });

  String carRegNo;
  String? carModel;
  String? carMake;

  factory AddCarToCustomerRequest.fromJson(Map<String, dynamic> json) =>
      AddCarToCustomerRequest(
        carRegNo: json["carRegNo"],
        carModel: json["carModel"],
        carMake: json["carMake"],
      );

  Map<String, dynamic> toJson() => {
        "carRegNo": carRegNo,
        "carModel": carModel,
        "carMake": carMake,
      };
}
