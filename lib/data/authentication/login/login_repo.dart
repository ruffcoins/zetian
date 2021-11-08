import 'package:dio/dio.dart';
import 'package:zetian/data/authentication/login/login_data.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/utils/operation.dart';

class _LoginRepo {
  loginUser(
    Dio dio,
    LoginRequest request,
    String url,
    OperationCompleted loginCompleted,
  ) {
    loginData.loginUser(dio, request, url).then((loginData) {
      loginCompleted(loginData);
    });
  }
}

_LoginRepo loginRepo = _LoginRepo();
