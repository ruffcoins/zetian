import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/authentication/logout/logout_repo.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/screens/login.dart';
import 'package:zetian/utils/operation.dart';

mixin LogoutHelper {
  BuildContext? _authContext;

  logoutUser(
      Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    logoutRepo.logoutUser(dio, baseUrl, _loginUserCompleted);
  }

  _loginUserCompleted(Operation operation) {
    print("${operation.result}");
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(false);

    // print("Operation Result: ${operation.code}");
    // print("Operation Succeeded = : ${operation.succeeded}");

    if (operation.code == 400){
      print ("400");
      final snackBar = SnackBar(
        content: Text("Something went wrong!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 404) {
      final snackBar = SnackBar(
        content: Text("User not logged in"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }
    // TODO: Push to Dashboard Page
    if (operation.succeeded == true) {
      Navigator.pushReplacement(
          _authContext!, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
