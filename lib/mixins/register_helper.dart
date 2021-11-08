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
      Dio dio, RegisterRequest request, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    registerRepo.registerUser(dio, request, baseUrl, _registerUserCompleted);
  }

  _registerUserCompleted(Operation operation) {
    print("${operation.result}");
    Provider.of<AuthenticationProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }
}
