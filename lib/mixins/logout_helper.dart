import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetian/data/authentication/logout/logout_repo.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/screens/login.dart';
import 'package:zetian/utils/operation.dart';

mixin LogoutHelper {
  BuildContext? _authContext;

  logoutUser(
      Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    // Get required token for API access from Authentication Provider.
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    logoutRepo.logoutUser(dio, baseUrl, _logoutUserCompleted, token);
  }

  _logoutUserCompleted(Operation operation) async {
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

    // Remove sharedPrefences instances and then log user out.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('token');
    prefs.remove('role');
    prefs.remove('id');
    prefs.remove('v');

    Navigator.pushReplacement(
        _authContext!, MaterialPageRoute(builder: (context) => Login()));
  }
}
