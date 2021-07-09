import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/screens/basic/employee/viewemployees.dart';

// ignore: must_be_immutable
class UpdateEmployee extends StatefulWidget {
  Message employeeDetails;

  UpdateEmployee({required this.employeeDetails});

  @override
  _UpdateEmployeeState createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> with EmployeeHelper {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  @override
  void initState() {
    firstNameController.text = widget.employeeDetails.firstName;
    lastNameController.text = widget.employeeDetails.lastName;
    addressController.text = widget.employeeDetails.address;
    phoneNumberController.text = widget.employeeDetails.phoneNumber;
    emailController.text = widget.employeeDetails.email;
    commentsController.text = widget.employeeDetails.comments;
    salaryController.text = widget.employeeDetails.salary.toString();
    bankNameController.text = widget.employeeDetails.bankName;
    accountNameController.text = widget.employeeDetails.accountName;
    accountNumberController.text = widget.employeeDetails.accountNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Center(
            child: Text(
              'Update Employee',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Montserrat',
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        endDrawer: SideMenu(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              //
              // Tablet View
              //
              return Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 10.0,
                            margin: EdgeInsets.only(
                                top: 30.0, left: 40.0, right: 40.0),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Personal Info',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: firstNameController,
                                      decoration: InputDecoration(
                                          labelText: "FIRSTNAME",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: lastNameController,
                                      decoration: InputDecoration(
                                          labelText: "LASTNAME",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                          labelText: "PHONE NUMBER",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          labelText: "EMAIL",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: addressController,
                                      decoration: InputDecoration(
                                          labelText: "ADDRESS",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: commentsController,
                                      decoration: InputDecoration(
                                          labelText: "COMMENTS",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                  ],
                                )),
                          ),
                          Card(
                            elevation: 10.0,
                            margin: EdgeInsets.only(
                                top: 30.0, left: 40.0, right: 40.0),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Salary Details',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: salaryController,
                                      decoration: InputDecoration(
                                          labelText: "SALARY",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: bankNameController,
                                      decoration: InputDecoration(
                                          labelText: "BANK NAME",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: accountNumberController,
                                      decoration: InputDecoration(
                                          labelText: "ACCOUNT NUMBER",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      controller: accountNameController,
                                      decoration: InputDecoration(
                                          labelText: "ACCOUNT NAME",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => EmployeeProfile(),
                              //     ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30.0, bottom: 30),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                // Register Button
                                child: Center(
                                  child: Text(
                                    'UPDATE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              //
              // Mobile View
              //
              return ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 10.0,
                        margin:
                            EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Personal Info',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                      labelText: "FIRSTNAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                      labelText: "LASTNAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                      labelText: "PHONE NUMBER",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      labelText: "EMAIL",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                      labelText: "ADDRESS",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: commentsController,
                                  decoration: InputDecoration(
                                      labelText: "COMMENTS",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 10.0,
                        margin:
                            EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Salary Details',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: salaryController,
                                  decoration: InputDecoration(
                                      labelText: "SALARY",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: bankNameController,
                                  decoration: InputDecoration(
                                      labelText: "BANK NAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: accountNumberController,
                                  decoration: InputDecoration(
                                      labelText: "ACCOUNT NUMBER",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: accountNameController,
                                  decoration: InputDecoration(
                                      labelText: "ACCOUNT NAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          updateEmployee(
                              Provider.of<AppProvider>(context, listen: false)
                                  .dio,
                              widget.employeeDetails.id,
                              UpdateEmployeeRequest(
                                  firstName:
                                      firstNameController.text.toLowerCase(),
                                  lastName:
                                      lastNameController.text.toLowerCase(),
                                  address: addressController.text,
                                  phoneNumber: phoneNumberController.text,
                                  email: emailController.text.toLowerCase(),
                                  comments: commentsController.text,
                                  salary: double.parse(salaryController.text),
                                  bankName: bankNameController.text,
                                  accountName: accountNameController.text,
                                  accountNumber: accountNumberController.text),
                              Provider.of<AppProvider>(context, listen: false)
                                  .baseUrl,
                              context);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewEmployees(),
                              ));
                        },
                        child: Provider.of<EmployeeProvider>(context,
                                    listen: false)
                                .isLoading
                            ? Center(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(top: 30.0, bottom: 30),
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()))
                            : Container(
                                margin: EdgeInsets.only(top: 30.0, bottom: 30),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  // Register Button
                                  child: Center(
                                    child: Text(
                                      'UPDATE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ],
              );
            }
          },
        ),
      );
    });
  }
}
