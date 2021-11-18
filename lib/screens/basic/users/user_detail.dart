import 'package:flutter/material.dart';
import 'package:zetian/models/user/read/get_user_response.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.username ?? "No name"),
              Text(user.id!),
              Text(user.role ?? "No role"),
              Text(user.v.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
