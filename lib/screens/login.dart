// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/login_helper.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/screens/basic/dashboard.dart';
import 'package:zetian/screens/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with LoginHelper {
  late String _email, _password;

  // final auth = FirebaseAuth.instance;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode passwordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
            // Mobile phone view
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(30.0, 110.0, 0.0, 0.0),
                            child: Text("Hello",
                                textScaleFactor: 1.0  ,
                                style: new TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                ))),
                        Row(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(34.0, 175.0, 0.0, 0.0),
                                child: Text("There",
                                    textScaleFactor: 1.0,
                                    style: new TextStyle(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.bold,
                                    ))),
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 175.0, 0.0, 0.0),
                                child: Text(".",
                                    style: TextStyle(
                                        fontSize: 80.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)))
                          ],
                        ),
                      ],
                    )),
                    Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 40.0, right: 40.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: "EMAIL",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(passwordField);
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value.trim();
                                });
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: passwordController,
                              focusNode: passwordField,
                              decoration: InputDecoration(
                                  labelText: "PASSWORD",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  _password = value.trim();
                                });
                              },
                            )
                          ],
                        )),
                    SizedBox(height: 40.0),
                    Consumer<AuthenticationProvider>(
                        builder: (context, provider, child) {
                      return provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              constraints: BoxConstraints(maxWidth: 700),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.green),
                              margin: EdgeInsets.only(left: 40.0, right: 40.0),
                              height: 40.0,
                              child: MaterialButton(
                                //color: Colors.green,
                                elevation: 7.0,
                                onPressed: () {
                                  print(usernameController.text);
                                  print(passwordController.text);
                                  loginUser(
                                      Provider.of<AppProvider>(context,
                                              listen: false)
                                          .dio,
                                      LoginRequest(
                                          username: usernameController.text,
                                          password: passwordController.text),
                                      Provider.of<AppProvider>(context,
                                              listen: false)
                                          .baseUrl,
                                      context);
                                  initState();
                                },
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                    }),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
