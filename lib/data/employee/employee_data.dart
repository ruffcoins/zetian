import 'package:dio/dio.dart';
import 'package:zetian/models/employee/create/create_new_employee_request.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/utils/operation.dart';

class EmployeeData {
  Future<Operation> createEmployee(
      Dio dio, CreateEmployeeRequest request, String baseUrl, String token) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/employee",
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

  Future<Operation> updateEmployee(
      Dio dio, String id, UpdateEmployeeRequest request, String baseUrl, String token) async {
    try {
      Response response = await dio.patch(
          "https://zeitan.herokuapp.com/employees/$id",
          data: request.toJson(), options: Options(
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

  Future<Operation> getAllEmployees(Dio dio, String baseUrl, String token) async {
    try {
      Response response =
          await dio.get("https://zeitan.herokuapp.com/employees", options: Options(
              headers: {
                "Authorization": "$token"
              }
          ));
      GetEmployeeResponse data = GetEmployeeResponse.fromJson(response.data);
      print("message from employee data");
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> deleteEmployee(Dio dio, String id, String baseUrl, String token) async {
    try {
      Response response =
          await dio.delete("https://zeitan.herokuapp.com/employees/$id", options: Options(
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

EmployeeData employeeData = EmployeeData();
