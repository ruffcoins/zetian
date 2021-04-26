import 'package:flutter/material.dart';
import 'package:zetian/screens/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          TextField(
                            decoration: InputDecoration(
                                labelText: "USERNAME",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          ),
                          TextField(
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
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "PHONE NUMBER",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          )
                        ],
                      )),
                  SizedBox(height: 40.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 700),
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      // Register Button
                      child: GestureDetector(
                        onTap: () {
                          Navigator.replace(context,
                              oldRoute: MaterialPageRoute(
                                  builder: (context) => Register()),
                              newRoute: MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
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
                  Container(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                          TextField(
                            decoration: InputDecoration(
                                labelText: "USERNAME",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          ),
                          TextField(
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
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "PHONE NUMBER",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          )
                        ],
                      )),
                  SizedBox(height: 40.0),
                  Container(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      // Register Button
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
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
                  Container(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
