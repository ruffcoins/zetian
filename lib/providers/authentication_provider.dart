import 'package:flutter/material.dart';
import 'package:zetian/models/authentication/login/login_response.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  LoginResponse? result;

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    notifyListeners();
  }

  // This function is called to help the shared_preference package repopulate the LoginInformation of the user
  // so as to enable other functionality that requires the token and id of user to operate without having to
  // make an API call
  void setStartInfo(String username, String token, String id, String role, int v){
    result = LoginResponse(success: true, message: LoginMessage(id: id, username: username, role: role, v: v), token: token);
  }

  void updateUserInformation(LoginResponse userResult) {
    result = userResult;
    notifyListeners();
  }
}
