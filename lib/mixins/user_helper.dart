import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/user/user_repo.dart';
import 'package:zetian/models/user/read/get_user_response.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/user_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin UserHelper {
  BuildContext? _authContext;

  getAllUsers(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    print("message for the Gods");
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<UserProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    print("Get User Started");
    userRepo.getAllUsers(dio, baseUrl, _getUsersCompleted, token);
  }

  _getUsersCompleted(Operation operation) {
    UserResponse userResponse = operation.result;
    List<User>? users = userResponse.message;

    Provider.of<UserProvider>(_authContext!, listen: false)
        .updateUserResult(users!);
    print("Get User Completed");
    for (User item in users){
      print (item.id);
    }
    Provider.of<UserProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }
}
