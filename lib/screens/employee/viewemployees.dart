import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/employee/addemployee.dart';

class ViewEmployees extends StatefulWidget {
  @override
  _ViewEmployeesState createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> {
  bool employeeList = true;

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
              return Container(
                padding: EdgeInsets.only(bottom: 70.0),
                child: ListView.builder(
                  itemCount: 15,
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
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEmployee()));
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
  }
}
