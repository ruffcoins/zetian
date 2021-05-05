import 'package:flutter/material.dart';
import 'package:zetian/screens/customer/viewcustomers.dart';
import 'package:zetian/screens/dashboard.dart';
import 'package:zetian/screens/sale/viewsales.dart';
import 'package:zetian/screens/service/viewservices.dart';

class SideMenu extends StatelessWidget {
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
            Navigator.push(context,
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
            Navigator.push(context,
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
            Navigator.push(
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
          },
        ),
        Divider(
          height: 2.0,
          color: Colors.black45,
        ),
      ],
    ));
  }
}
