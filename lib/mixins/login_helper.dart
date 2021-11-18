import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/authentication/login/login_repo.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/screens/basic/dashboard.dart';
import 'package:zetian/screens/register.dart';
import 'package:zetian/utils/operation.dart';

mixin LoginHelper {
  BuildContext? _authContext;

  loginUser(
      Dio dio, LoginRequest request, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    loginRepo.loginUser(dio, request, baseUrl, _loginUserCompleted);
  }

  _loginUserCompleted(Operation operation) async {
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
        content: Text("Wrong Username or Password"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 503) {
      final snackBar = SnackBar(
        content: Text("Service Temporarily Unavailable"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }
    // TODO: Push to Dashboard Page
    if (operation.succeeded == true) {
      Provider.of<AuthenticationProvider>(_authContext!, listen: false)
          .updateUserInformation(operation.result);

      // print("Got here: User Info");
      // print(response.data);

      Navigator.pushReplacementNamed(_authContext!, '/dashboard');
    }
  }
}
