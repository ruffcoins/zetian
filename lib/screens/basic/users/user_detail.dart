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
          margin: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'User Name',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.username ?? "No name",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                title: Text(
                  'User ID ',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.id!,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                title: Text(
                  'User Role',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.role ?? "No role",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
