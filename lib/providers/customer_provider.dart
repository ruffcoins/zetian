import 'package:flutter/material.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';

class CustomerProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getEmployeeLoading = false;
  // Made null-safe so as to differentiate between non-existence of data and empty returns.
  List<CustomerMessage>? customers;

  void updateIsLoading(bool isLoadingGotten, bool shouldNotify) {
    isLoading = isLoadingGotten;
    print(isLoading);
    if(shouldNotify) {
      notifyListeners();
    }
  }

  void updateCustomerResult(List<CustomerMessage> customersResult) {
    customers = customersResult;
    notifyListeners();
  }
}
