// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';
import 'package:zetian/screens/basic/dashboard.dart';
import 'package:zetian/screens/basic/employee/viewemployees.dart';
import 'package:zetian/screens/basic/expense/viewexpenses.dart';
import 'package:zetian/screens/basic/reports/reportlist.dart';
import 'package:zetian/screens/basic/sale/viewsales.dart';
import 'package:zetian/screens/basic/service/viewservices.dart';
import 'package:zetian/screens/login.dart';

class SideMenu extends StatelessWidget {
  // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);

              // Update the state of the app
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                      (route) => false);
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Customers',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);

              // Update the state of the app
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ViewCustomers()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Services',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);

              // Update the state of the app
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ViewServices()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Sales',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);

              // Update the state of the app
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ViewSales()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Expenses',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ViewExpense()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Reports',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ReportList()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Employees',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ViewEmployees()));
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(''),
                ),
                ListTile(
                  title: Text(''),
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Colors.red),
                  ),
                  onTap: () {
                    // try {
                    // await auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    // } on FirebaseAuthException catch (e) {
                    //   print('Failed with error code: ${e.code}');
                    //   print(e.message);
                    // }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
