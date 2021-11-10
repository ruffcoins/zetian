import 'package:dio/dio.dart';
import 'package:zetian/data/authentication/logout/logout.dart';
import 'package:zetian/utils/operation.dart';

class _LogoutRepo {
  logoutUser(
    Dio dio,
    String url,
    OperationCompleted logoutCompleted,
  ) {
    logout.logout(dio, url).then((logoutData) {
      logoutCompleted(logoutData);
    });
  }
}

_LogoutRepo logoutRepo = _LogoutRepo();
