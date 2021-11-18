import 'package:dio/dio.dart';
import 'package:zetian/data/user/user_data.dart';
import 'package:zetian/utils/operation.dart';

class _UserRepo {
  getAllUsers(
      Dio dio,
      String url,
      OperationCompleted getCompleted,
      String token,
      ) {
    userData.getAllUsers(dio, url, token).then((userData) {
      getCompleted(userData);
    });
  }
}

_UserRepo userRepo = _UserRepo();
