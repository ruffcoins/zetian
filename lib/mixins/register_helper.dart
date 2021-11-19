import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/authentication/register/register_repo.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin RegisterHelper {
  BuildContext? _authContext;

  registerUser(
      Dio dio, RegisterRequest request, String baseUrl, String userType, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    registerRepo.registerUser(dio, request, baseUrl, userType, _registerUserCompleted, token);
  }

  _registerUserCompleted(Operation operation) {
    print("${operation.result}");
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(false);

    if (operation.code == 401){
      print ("400");
      final snackBar = SnackBar(
        content: Text("User not Authorized to create accounts!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 400){
      print ("400");
      final snackBar = SnackBar(
        content: Text("Something went wrong!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 422) {
      final snackBar = SnackBar(
        content: Text("User already exists"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 412) {
      final snackBar = SnackBar(
        content: Text("Password Length must be up to 7 characters\nDo not use 'password' as password"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }

    if (operation.code == 201 || operation.code == 200){
      print ("200");
      final snackBar = SnackBar(
        content: Text("User created successfully!"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(_authContext!).showSnackBar(snackBar);
    }
  }
}
