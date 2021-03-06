import 'package:dio/dio.dart';
import 'package:zetian/data/employee/employee_data.dart';
import 'package:zetian/models/employee/create/create_new_employee_request.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/utils/operation.dart';

class _EmployeeRepo {
  createEmployee(
    Dio dio,
    CreateEmployeeRequest request,
    String url,
    OperationCompleted createCompleted,
    String token
  ) {
    employeeData.createEmployee(dio, request, url, token).then((employeeData) {
      createCompleted(employeeData);
    });
  }

  updateEmployee(
    Dio dio,
    String id,
    UpdateEmployeeRequest request,
    String url,
    OperationCompleted updateCompleted,
    String token
  ) {
    employeeData.updateEmployee(dio, id, request, url, token).then((employeeData) {
      updateCompleted(employeeData);
    });
  }

  getAllEmployees(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
    String token,
  ) {
    employeeData.getAllEmployees(dio, url, token).then((employeeData) {
      getCompleted(employeeData);
    });
  }

  deleteEmployee(
    Dio dio,
    String id,
    String url,
    OperationCompleted getCompleted,
    String token
  ) {
    employeeData.deleteEmployee(dio, id, url, token).then((employeeData) {
      getCompleted(employeeData);
    });
  }
}

_EmployeeRepo employeeRepo = _EmployeeRepo();
