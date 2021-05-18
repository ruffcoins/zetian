import 'package:flutter/material.dart';
import 'package:zetian/screens/login.dart';

class Register extends StatefulWidget {
  // late String _email;
  // late String _password;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FocusNode passwordField = FocusNode();
  final FocusNode confirmPasswordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth >= 768) {
            // Tablet View
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(
                                      34.0, 100.0, 0.0, 0.0),
                                  child: Text("Register",
                                      style: new TextStyle(
                                        fontSize: 80.0,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
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
                          EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
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
                            // onChanged: (value) {
                            //   setState(() {
                            //     _email = value;
                            //   });
                            // },
                          ),
                          TextFormField(
                            focusNode: passwordField,
                            textInputAction: TextInputAction.next,
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
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(confirmPasswordField);
                            },
                            // onChanged: (value) {
                            //   setState(() {
                            //     _password = value;
                            //   });
                            // },
                          ),
                          TextFormField(
                            focusNode: confirmPasswordField,
                            decoration: InputDecoration(
                                labelText: "CONFIRM PASSWORD",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            obscureText: true,
                            // onChanged: (value) {
                            //   setState(() {
                            //     _password = value;
                            //   });
                            // },
                          ),
                        ],
                      )),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
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
                        // Register Button
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        // Go Back Button
                        child: Center(
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Mobile View
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(34.0, 0.0, 0.0, 0.0),
                              child: Text("Register",
                                  style: new TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Container(
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
                          EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
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
                            // onChanged: (value) {
                            //   setState(() {
                            //     _email = value;
                            //   });
                            // },
                          ),
                          TextFormField(
                            focusNode: passwordField,
                            textInputAction: TextInputAction.next,
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
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(confirmPasswordField);
                            },
                            // onChanged: (value) {
                            //   setState(() {
                            //     _password = value;
                            //   });
                            // },
                          ),
                          TextFormField(
                            focusNode: confirmPasswordField,
                            decoration: InputDecoration(
                                labelText: "CONFIRM PASSWORD",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            obscureText: true,
                            // onChanged: (value) {
                            //   setState(() {
                            //     _password = value;
                            //   });
                            // },
                          ),
                        ],
                      )),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      // FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //   email: _email,
                      //   password: _password
                      // ).then((signedInUser) {
                      //
                      // }).catchError((e) {
                      //   print(e);
                      // });
                      // Navigator.pop(context);
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        // Register Button
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        // Go Back Button
                        child: Center(
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
