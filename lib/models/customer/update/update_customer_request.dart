// To parse this JSON data, do
//
//     final updateCustomerRequest = updateCustomerRequestFromJson(jsonString);

import 'dart:convert';

UpdateCustomerRequest updateCustomerRequestFromJson(String str) =>
    UpdateCustomerRequest.fromJson(json.decode(str));

String updateCustomerRequestToJson(UpdateCustomerRequest data) =>
    json.encode(data.toJson());

class UpdateCustomerRequest {
  UpdateCustomerRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.customerCars,
  });

  String? firstName;
  String? lastName;
  String? phoneNumber;
  List<CustomerCar>? customerCars;

  factory UpdateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      UpdateCustomerRequest(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        customerCars: json["customerCars"] == null
            ? null
            : List<CustomerCar>.from(
                json["customerCars"].map((x) => CustomerCar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "cars": customerCars == null
            ? null
            : List<dynamic>.from(customerCars!.map((x) => x.toJson())),
      };
}

class CustomerCar {
  CustomerCar({
    this.id,
    this.carRegNo,
    this.carMake,
    this.carModel,
  });

  String? id;
  String? carRegNo;
  String? carMake;
  String? carModel;

  factory CustomerCar.fromJson(Map<String, dynamic> json) => CustomerCar(
        id: json["id"] == null ? null : json["id"],
        carRegNo: json["carRegNo"] == null ? null : json["carRegNo"],
        carMake: json["carMake"] == null ? null : json["carMake"],
        carModel: json["carModel"] == null ? null : json["carModel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "carRegNo": carRegNo == null ? null : carRegNo,
        "carMake": carMake == null ? null : carMake,
        "carModel": carModel == null ? null : carModel,
      };
}
