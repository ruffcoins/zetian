import 'package:dio/dio.dart';
import 'package:zetian/models/customer/create/create_new_customer_request.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/customer/update/add_car_to_customer_request.dart';
import 'package:zetian/models/customer/update/update_customer_request.dart';
import 'package:zetian/utils/operation.dart';

class CustomerData {
  Future<Operation> createCustomer(
      Dio dio, CreateCustomerRequest request, String baseUrl, String token) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/customer",
          data: request.toJson(),
          options: Options(
              headers: {
                "Authorization": "$token"
              }
          )
      );
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> updateCustomer(
      Dio dio, String id, UpdateCustomerRequest request, String baseUrl, String token) async {
    try {
      Response response = await dio.patch(
          "https://zeitan.herokuapp.com/customers/$id",
          options: Options(
              headers: {
                "Authorization": "$token"
              }
          ),
          data: request.toJson());
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> addCarToCustomer(Dio dio, String id, AddCarToCustomerRequest request, String baseUrl, String token) async {
    try {
      Response response = await dio.patch(
          "https://zeitan.herokuapp.com/customers/addCar/$id",
          data: request.toJson(),
          options: Options(
            headers: {
              "Authorization": "$token"
            }
      ));
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> getAllCustomers(Dio dio, String baseUrl, String token) async {
    print("Got here Data 1");
    try {
      Response response =
          await dio.get("https://zeitan.herokuapp.com/customers", options: Options(
              headers: {
                "Authorization": "$token"
              }
          ));
      print(response.data);
      GetCustomerResponse data = GetCustomerResponse.fromJson(response.data);
      print("message from customer data");
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print("Got here Data 2");
      print(e);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> deleteCustomer(Dio dio, String id, String baseUrl, String token) async {
    try {
      Response response =
          await dio.delete("https://zeitan.herokuapp.com/customers/$id", options: Options(
              headers: {
                "Authorization": "$token"
              }
          ));
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }
}

CustomerData customerData = CustomerData();
