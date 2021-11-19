import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/employee/employee_repo.dart';
import 'package:zetian/models/employee/create/create_new_employee_request.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin EmployeeHelper {
  BuildContext? _authContext;

  createEmployee(Dio dio, CreateEmployeeRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;

    employeeRepo.createEmployee(
        dio, request, baseUrl, _createEmployeeCompleted, token);
  }

  _createEmployeeCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  updateEmployee(Dio dio, String id, UpdateEmployeeRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    employeeRepo.updateEmployee(
        dio, id, request, baseUrl, _updateEmployeeCompleted, token);
  }

  _updateEmployeeCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }

  getAllEmployees(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    print("message for the Gods");
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    employeeRepo.getAllEmployees(dio, baseUrl, _getEmployeesCompleted, token);
  }

  _getEmployeesCompleted(Operation operation) {
    try {
      GetEmployeeResponse employeeResponse = operation.result;
      List<Message> employees = employeeResponse.message;

      Provider.of<EmployeeProvider>(_authContext!, listen: false)
          .updateEmployeeResult(employees);
    } catch (e){
      print(e);
    }
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }

  deleteEmployee(Dio dio, String id, String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    employeeRepo.deleteEmployee(dio, id, baseUrl, _deleteEmployeeCompleted, token);
  }

  _deleteEmployeeCompleted(Operation operation) {
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }
}
