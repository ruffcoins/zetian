import 'package:flutter/material.dart';
import 'package:zetian/models/authentication/login/login_response.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  LoginResponse? result;

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    notifyListeners();
  }

  void updateUserInformation(LoginResponse userResult) {
    result = userResult;
    notifyListeners();
  }
}
