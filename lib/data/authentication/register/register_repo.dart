import 'package:dio/dio.dart';
import 'package:zetian/data/authentication/register/register_data.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/utils/operation.dart';

class _RegisterRepo {
  registerUser(
    Dio dio,
    RegisterRequest request,
    String url,
    String userType,
    OperationCompleted registerCompleted,
    String token
  ) {
    registerData.registerUser(dio, request, url, userType, token).then((registerData) {
      registerCompleted(registerData);
    });
  }
}

_RegisterRepo registerRepo = _RegisterRepo();
