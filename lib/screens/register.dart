// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/register_helper.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/utils/string_extension.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with RegisterHelper {
  // late String _username, _password;
  String? dropdownValue;
  List<String> employeeNames = [];
  List<String> employeeID = [];
  String selectedEmployeeID = '';
  List<Message> employees = [];

  TextEditingController usernameController = TextEditingController();

  // TODO: Add Password restriction (!(<7) Characters)
  TextEditingController passwordController = TextEditingController();

  // List<String> employeeList = ['Dan', 'Esther', 'Timothy'];

  // final auth = FirebaseAuth.instance;

  final FocusNode passwordField = FocusNode();
  final FocusNode confirmPasswordField = FocusNode();

  @override
  void initState() {
    employees = Provider.of<EmployeeProvider>(context, listen: false).employees;

    for (var employee in employees) {
      employeeNames.add(employee.firstName.capitalize() +
          " " +
          employee.lastName.capitalize());
    }

    for (var employee in employees) {
      employeeID.add(employee.id);
    }
  }

  String findEmployeeID(String name) {
    int position = 0;

    for (int i = 0; i < employeeNames.length; i++) {
      if (name == employeeNames[i]) {
        position = i;
      }
    }

    return employeeID[position];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(34.0, 0.0, 0.0, 0.0),
                          child: Text("Register",
                              textScaleFactor: 1,
                              style: new TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                              ))),
                      Container(
                          child: Text(".",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)))
                    ],
                  ),
                ],
              )),
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: "USERNAME",
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(passwordField);
                        },
                        // onChanged: (value) {
                        //   setState(() {
                        //     _username = value.trim();
                        //   });
                        // },
                      ),
                      TextFormField(
                        focusNode: passwordField,
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                        // onChanged: (value) {
                        //   setState(() {
                        //     _password = value.trim();
                        //   });
                        // },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 8.0),
                      //   child: DropdownType(
                      //       model: 'EMPLOYEE',
                      //       width: 0.7,
                      //       dropdownValue: Provider.of<EmployeeProvider>(
                      //                   context,
                      //                   listen: false)
                      //               .isLoading
                      //           ? ""
                      //           : dropdownValue,
                      //       objectList: Provider.of<EmployeeProvider>(context,
                      //                   listen: false)
                      //               .isLoading
                      //           ? []
                      //           : employeeNames,
                      //       onChanged: (value) {
                      //         dropdownValue = value;
                      //         selectedEmployeeID = findEmployeeID(value);
                      //       }),
                      // )
                    ],
                  )),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () {
                  print("Registering User...");
                  registerUser(
                      Provider.of<AppProvider>(context, listen: false).dio,
                      RegisterRequest(
                          username: usernameController.text,
                          password: passwordController.text),
                      Provider.of<AppProvider>(context, listen: false).baseUrl,
                      context);
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
        ));
  }
}
