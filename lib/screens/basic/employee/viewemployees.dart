import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/screens/basic/employee/addemployee.dart';
import 'package:zetian/screens/basic/employee/employeeprofile.dart';
import 'package:zetian/utils/string_extension.dart';

class ViewEmployees extends StatefulWidget {
  @override
  _ViewEmployeesState createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> with EmployeeHelper {
  bool employeeList = true;
  List<GetEmployeeResponse> employeeResult = [];

  @override
  void initState() {
    getAllEmployees(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (Route<dynamic> route) => false);
        return true;
      },
      child: Consumer<EmployeeProvider>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.green),
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
            title: Center(
              child: Text(
                'Employees',
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
                // If Employee list is empty show the empty employee screen
                if (employeeList == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text(
                          'No Employees',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                          ),
                        ),
                        Icon(
                          Icons.error,
                          color: Colors.black38,
                          size: 50.0,
                        )
                      ],
                    ),
                  );
                } else {
                  // If Employee list is not empty, show employee list
                  return Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                      constraints: BoxConstraints(maxWidth: 600),
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Card(
                            //                           <-- Card widget
                            child: ListTile(
                              leading: Icon(Icons.emoji_people),
                              title: Text('Employee Name'),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              } else {
                //
                // Mobile View
                //
                if (employeeList == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text(
                          'No Employees',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                          ),
                        ),
                        Icon(
                          Icons.error,
                          color: Colors.black38,
                          size: 50.0,
                        )
                      ],
                    ),
                  );
                } else {
                  // If Employee list is not empty, show Employee list
                  return Provider.of<EmployeeProvider>(context, listen: true)
                          .isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 4,
                        ))
                      : Container(
                          padding: EdgeInsets.only(bottom: 70.0),
                          child: ListView.builder(
                            itemCount: provider.employees.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmployeeProfile(
                                              employeeDetails:
                                                  provider.employees[index])));
                                },
                                child: Card(
                                  //                           <-- Card widget
                                  child: ListTile(
                                    leading: Icon(Icons.emoji_people),
                                    title: Text(provider
                                            .employees[index].firstName
                                            .capitalize() +
                                        " " +
                                        provider.employees[index].lastName
                                            .capitalize()),
                                    subtitle: Text(
                                        provider.employees[index].phoneNumber),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }
              }
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddEmployee()));
            },
            label: Text(
              'New Employee',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
            ),
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      }),
    );
  }
}
