// To parse this JSON data, do
//
//     final getSalesResponse = getSalesResponseFromJson(jsonString);

import 'dart:convert';

GetSaleResponse getSalesResponseFromJson(String str) =>
    GetSaleResponse.fromJson(json.decode(str));

String getSalesResponseToJson(GetSaleResponse data) =>
    json.encode(data.toJson());

class GetSaleResponse {
  GetSaleResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<SalesResult> message;

  factory GetSaleResponse.fromJson(Map<String, dynamic> json) =>
      GetSaleResponse(
        success: json["success"],
        message: List<SalesResult>.from(
            json["message"].map((x) => SalesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class SalesResult {
  SalesResult({
    required this.sale,
    required this.car,
    required this.customer,
    required this.service,
  });

  Sale sale;
  Car car;
  Customer customer;
  List<Service> service;

  factory SalesResult.fromJson(Map<String, dynamic> json) => SalesResult(
        sale: Sale.fromJson(json["sale"]),
        car: Car.fromJson(json["car"]),
        customer: Customer.fromJson(json["customer"]),
        service:
            List<Service>.from(json["service"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sale": sale.toJson(),
        "car": car.toJson(),
        "customer": customer.toJson(),
        "service": List<dynamic>.from(service.map((x) => x.toJson())),
      };
}

class Car {
  Car({
    required this.id,
    required this.carRegNo,
    required this.carMake,
    required this.carModel,
  });

  String id;
  String carRegNo;
  String carMake;
  String carModel;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        carRegNo: json["carRegNo"],
        carMake: json["carMake"],
        carModel: json["carModel"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "carRegNo": carRegNo,
        "carMake": carMake,
        "carModel": carModel,
      };
}

class Customer {
  Customer({
    required this.carsId,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  List<String> carsId;
  String id;
  String firstName;
  String lastName;
  String phoneNumber;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        carsId: List<String>.from(json["cars_id"].map((x) => x)),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "cars_id": List<dynamic>.from(carsId.map((x) => x)),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      };
}

class Sale {
  Sale({
    required this.serviceId,
    required this.id,
    required this.carRegNo,
    required this.customerId,
    required this.employeeId,
    required this.date,
    required this.totalAmount,
  });

  List<String> serviceId;
  String id;
  String carRegNo;
  String customerId;
  String employeeId;
  DateTime date;
  int totalAmount;

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        serviceId: List<String>.from(json["service_id"].map((x) => x)),
        id: json["_id"],
        carRegNo: json["carRegNo"],
        customerId: json["customer_id"],
        employeeId: json["employee_id"],
        date: DateTime.parse(json["date"]),
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": List<dynamic>.from(serviceId.map((x) => x)),
        "_id": id,
        "carRegNo": carRegNo,
        "customer_id": customerId,
        "employee_id": employeeId,
        "date": date.toIso8601String(),
        "totalAmount": totalAmount,
      };
}

class Service {
  Service({
    required this.id,
    required this.name,
    required this.amount,
  });

  String id;
  String name;
  int amount;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "amount": amount,
      };
}
