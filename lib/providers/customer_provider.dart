import 'package:flutter/material.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';

class CustomerProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getEmployeeLoading = false;
  List<CustomerMessage> customers = [];

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    print(isLoading);
    notifyListeners();
  }

  void updateCustomerResult(List<CustomerMessage> customersResult) {
    customers = customersResult;
    notifyListeners();
  }
}
