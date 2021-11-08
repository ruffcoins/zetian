import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/authentication/login/login_repo.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/screens/basic/dashboard.dart';
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

  _loginUserCompleted(Operation operation) {
    print("${operation.result}");
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(false);

    print("Operation Result: ${operation.code}");
    print("Operation Succeeded = : ${operation.succeeded}");

    // TODO: Push to Dashboard Page
    if (operation.succeeded == true) {
      Navigator.pushReplacement(
          _authContext!, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      print("Login did not succeed: _loginUserCompleted function()");
    }
  }
}
