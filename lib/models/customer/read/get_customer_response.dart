// To parse this JSON data, do
//
//     final createSaleRequest = createSaleRequestFromJson(jsonString);

import 'dart:convert';

GetCustomerResponse createSaleRequestFromJson(String str) =>
    GetCustomerResponse.fromJson(json.decode(str));

String createSaleRequestToJson(GetCustomerResponse data) =>
    json.encode(data.toJson());

class GetCustomerResponse {
  GetCustomerResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<CustomerMessage> message;

  factory GetCustomerResponse.fromJson(Map<String, dynamic> json) =>
      GetCustomerResponse(
        success: json["success"],
        message: List<CustomerMessage>.from(
            json["message"].map((x) => CustomerMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class CustomerMessage {
  CustomerMessage({
    required this.customer,
    required this.cars,
    required this.sale,
    required this.customerServices,
    required this.totalAmount,
    required this.transactionCount,
    required this.carCount,
  });

  Customer customer;
  List<Car> cars;
  List<Sale> sale;
  List<CustomerService> customerServices;
  int totalAmount;
  int transactionCount;
  int carCount;

  factory CustomerMessage.fromJson(Map<String, dynamic> json) =>
      CustomerMessage(
        customer: Customer.fromJson(json["customer"]),
        cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
        sale: List<Sale>.from(json["sale"].map((x) => Sale.fromJson(x))),
        customerServices: List<CustomerService>.from(
            json["customerServices"].map((x) => CustomerService.fromJson(x))),
        totalAmount: json["totalAmount"],
        transactionCount: json["transactionCount"],
        carCount: json["carCount"],
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
        "sale": List<dynamic>.from(sale.map((x) => x.toJson())),
        "customerServices":
            List<dynamic>.from(customerServices.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "transactionCount": transactionCount,
        "carCount": carCount,
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

class CustomerService {
  CustomerService({
    required this.id,
    required this.name,
    required this.amount,
  });

  String id;
  String name;
  int amount;

  factory CustomerService.fromJson(Map<String, dynamic> json) =>
      CustomerService(
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

class Sale {
  Sale({
    required this.serviceId,
    required this.id,
    required this.customerId,
    required this.employeeId,
    required this.date,
    required this.totalAmount,
  });

  List<String> serviceId;
  String id;
  String customerId;
  String employeeId;
  DateTime date;
  int totalAmount;

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        serviceId: List<String>.from(json["service_id"].map((x) => x)),
        id: json["_id"],
        customerId: json["customer_id"],
        employeeId: json["employee_id"],
        date: DateTime.parse(json["date"]),
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": List<dynamic>.from(serviceId.map((x) => x)),
        "_id": id,
        "customer_id": customerId,
        "employee_id": employeeId,
        "date": date.toIso8601String(),
        "totalAmount": totalAmount,
      };
}
