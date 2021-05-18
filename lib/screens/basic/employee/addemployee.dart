import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/basic/employee/employeeprofile.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
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
            'Add Employee',
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
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(height: 40.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmployeeProfile(),
                                  ));
                            },
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                padding:
                                    EdgeInsets.only(left: 40.0, right: 40.0),
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  // Register Button
                                  child: Center(
                                    child: Text(
                                      'SAVE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                        ],
                      ),
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeProfile(),
                              ));
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
                                'SAVE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
