import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zetian/screens/basic/dashboard.dart';
import 'package:zetian/screens/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  final FocusNode passwordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          //Tab View
          if (constraints.maxWidth >= 768) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Stack(
                        children: [
                          Container(
                              padding:
                              EdgeInsets.fromLTRB(30.0, 110.0, 0.0, 0.0),
                              child: Text("Hello",
                                  style: new TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(
                                      34.0, 175.0, 0.0, 0.0),
                                  child: Text("There",
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
                      constraints: BoxConstraints(maxWidth: 700),
                      padding:
                      EdgeInsets.only(top: 35.0, left: 40.0, right: 40.0),
                      child: Column(
                        children: [
                          TextFormField(
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
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
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
                          )
                        ],
                      )),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
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
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 700),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New User ?',
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15.0),
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
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
                    GestureDetector(
                      onTap: () async {
                        try {
                          await auth.signInWithEmailAndPassword(
                              email: _email, password: _password);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } on FirebaseAuthException catch (e) {
                          print('Failed with error code: ${e.code}');
                          print(e.message);
                        }
                      },
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        padding: EdgeInsets.only(left: 40.0, right: 40.0),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
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
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New User ?',
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15.0),
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
