import 'package:flutter/material.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';

class EmployeeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getEmployeeLoading = false;
  List<Message> employees = [];

  void updateIsLoading(bool isLoadingGotten, bool shouldNotify) {
    isLoading = isLoadingGotten;
    print('employee provider is loading');
    if (shouldNotify) {
      notifyListeners();
    }
  }

  void updateEmployeeResult(List<Message> employeesResult) {
    employees = employeesResult;
    notifyListeners();
  }
}
