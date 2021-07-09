import 'package:flutter/material.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';

class EmployeeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getEmployeeLoading = false;
  List<Message> employees = [];

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    print(isLoading);
    notifyListeners();
  }

  void updateEmployeeResult(List<Message> employeesResult) {
    employees = employeesResult;
    notifyListeners();
  }
}
