// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/logout_helper.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/authentication_provider.dart';

class SideMenu extends StatelessWidget with LogoutHelper {
  // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: <Widget>[
          DrawerHeader(
            child: Consumer<AuthenticationProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(provider.result?.message.username ?? "", style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          Text(provider.result?.message.id ?? "",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                          ),
                      ],
                    );
                  }
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
              print("Modal Route: ${ModalRoute.of(context)!.settings.name}");

              // Prevent page from calling itself.
              if (ModalRoute.of(context)!.settings.name != "/dashboard"){
                Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (Route<dynamic> route) => false);
              }
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
              print("Modal Route: ${ModalRoute.of(context)!.settings.name}");
              if (ModalRoute.of(context)!.settings.name != "/customers") {
                Navigator.pushNamedAndRemoveUntil(context, '/customers', (Route<dynamic> route) => false);
              }
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
              if (ModalRoute.of(context)!.settings.name != "/services") {
                Navigator.pushNamedAndRemoveUntil(context, '/services', (Route<dynamic> route) => false);
              }
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
              if (ModalRoute.of(context)!.settings.name != "/sales") {
                Navigator.pushNamedAndRemoveUntil(context, '/sales', (Route<dynamic> route) => false);
              }
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
              if (ModalRoute.of(context)!.settings.name != "/expenses") {
                Navigator.pushNamedAndRemoveUntil(context, '/expenses', (Route<dynamic> route) => false);
              }
            },
          ),
          Divider(
            height: 2.0,
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Users',
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
              if (ModalRoute.of(context)!.settings.name != "/users") {
                Navigator.pushNamedAndRemoveUntil(context, '/users', (Route<dynamic> route) => false);
              }
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
              if (ModalRoute.of(context)!.settings.name != "/employees") {
                Navigator.pushNamedAndRemoveUntil(context, '/employees', (Route<dynamic> route) => false);
              }
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
                SizedBox(height: 50),
                Consumer<AuthenticationProvider>(builder: (context, provider, child) {
                  return provider.isLoading ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ) : ListTile(
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
                      logoutUser(Provider.of<AppProvider>(context,
                          listen: false)
                          .dio,
                        Provider.of<AppProvider>(context,
                            listen: false)
                            .baseUrl,
                        context
                      );
                      // try {
                      // await auth.signOut();
                      // } on FirebaseAuthException catch (e) {
                      //   print('Failed with error code: ${e.code}');
                      //   print(e.message);
                      // }
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
