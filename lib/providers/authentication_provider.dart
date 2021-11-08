import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    notifyListeners();
  }
}
