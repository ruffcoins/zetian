import 'package:flutter/material.dart';
import 'package:zetian/models/user/read/get_user_response.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  List<User> users = [];

  void updateIsLoading(bool isLoadingGotten, bool shouldNotify) {
    isLoading = isLoadingGotten;
    print('user provider is loading');
    if (shouldNotify) {
      notifyListeners();
    }
  }

  void updateUserResult(List<User> usersResult) {
    users = usersResult;
    notifyListeners();
  }
}
