import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/screens/basic/employee/updateemployee.dart';
import 'package:zetian/screens/basic/employee/viewemployees.dart';
import 'package:zetian/utils/string_extension.dart';

class EmployeeProfile extends StatefulWidget {
  Message employeeDetails;

  EmployeeProfile({required this.employeeDetails});

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> with EmployeeHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: PopupMenuButton(
              elevation: 10,
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateEmployee(
                                  employeeDetails: widget.employeeDetails)));
                    },
                    child: Center(
                      child: Text(
                        "Update",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text(
                                "Are you sure you wish to delete this employee?"),
                            actions: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    deleteEmployee(
                                        Provider.of<AppProvider>(context,
                                                listen: false)
                                            .dio,
                                        widget.employeeDetails.id,
                                        Provider.of<AppProvider>(context,
                                                listen: false)
                                            .baseUrl,
                                        context);

                                    Provider.of<EmployeeProvider>(context,
                                                listen: false)
                                            .isLoading
                                        ? () {}
                                        : Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewEmployees(),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 5),
                                    child: const Text("Delete",
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18)),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 10),
                                  child: const Text("CANCEL"),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        "Delete",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
            //
            //Mobile View
            //
            return Column(
              children: [
                // Name Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0, top: 7.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/customer-image.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              widget.employeeDetails.firstName.capitalize() +
                                  " " +
                                  widget.employeeDetails.lastName.capitalize(),
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Calabar, NG',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        wordSpacing: 4,
                                        letterSpacing: 2),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // Next Section
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 13, right: 25, left: 25),
                        child: Text(
                          'Profile',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 63, right: 25, left: 25),
                        child: ListView(
                            children: [
                              ListTile(
                                title: Text(
                                  'Phone Number',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.phoneNumber,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Address',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.address,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Salary',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.salary.toString(),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                              ListTile(
                                title: Text(
                                  'Bank Name',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.bankName,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Account Number',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.accountNumber,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Account Name',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  widget.employeeDetails.accountName,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                              ListTile(
                                title: Text(
                                  'Comments',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                widget.employeeDetails.comments,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ))
              ],
            );
        },
      ),
    );
  }
}
