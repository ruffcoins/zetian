import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetian/data/authentication/login/login_repo.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
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
        content: Text("Something went wrong, check internet!"),
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
      print(operation.result.message.username);
      print(operation.result.token);

      // Persist the username and token variables in the memory of the device.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', '${operation.result.message.username}');
      prefs.setString('token', '${operation.result.token}');
      prefs.setString('role', '${operation.result.message.role}');
      prefs.setString('id', '${operation.result.message.id}');
      prefs.setInt('v', operation.result.message.v);

      Provider.of<AuthenticationProvider>(_authContext!, listen: false)
          .updateUserInformation(operation.result);

      // print("Got here: User Info");
      // print(response.data);

      Navigator.pushReplacementNamed(_authContext!, '/dashboard');
    }
  }
}
