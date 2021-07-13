import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/employee/employee_repo.dart';
import 'package:zetian/models/employee/create/create_new_employee_request.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin EmployeeHelper {
  BuildContext? _authContext;

  createEmployee(Dio dio, CreateEmployeeRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;

    employeeRepo.createEmployee(
        dio, request, baseUrl, _createEmployeeCompleted);
  }

  _createEmployeeCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  updateEmployee(Dio dio, String id, UpdateEmployeeRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    employeeRepo.updateEmployee(
        dio, id, request, baseUrl, _updateEmployeeCompleted);
  }

  _updateEmployeeCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  getAllEmployees(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    print("message for the Gods");

    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    employeeRepo.getAllEmployees(dio, baseUrl, _getEmployeesCompleted);
  }

  _getEmployeesCompleted(Operation operation) {
    GetEmployeeResponse employeeResponse = operation.result;
    List<Message> employees = employeeResponse.message;

    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateEmployeeResult(employees);
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  deleteEmployee(Dio dio, String id, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    employeeRepo.deleteEmployee(dio, id, baseUrl, _deleteEmployeeCompleted);
  }

  _deleteEmployeeCompleted(Operation operation) {
    Provider.of<EmployeeProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }
}
