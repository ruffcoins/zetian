import 'package:flutter/material.dart';
import 'package:zetian/screens/customer/updatecustomer.dart';

class CustomerProfile extends StatefulWidget {
  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
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
                  padding:
                      EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateCustomer()));
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
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
                  MaterialPageRoute(builder: (context) => CustomerProfile()));
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
              'Sales',
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
      )),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 768) {
            //
            // Tablet View
            //
            return Column(
              children: [
                // Name Section
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                'Chibueze Nnaemeka',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
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
                                      'Warri, NG',
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
                ),
                // Next Section
                Padding(
                  padding: const EdgeInsets.only(
                      left: 38, right: 38, top: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '17',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Transactions',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        width: 1,
                        height: 22,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5000',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Spent',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 33, right: 25, left: 25),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 33, right: 25, left: 25, bottom: 25),
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.black87
                                // fontWeight: FontWeight.bold
                                ),
                          ),
                        ),
                        Column(children: [
                          ListTile(
                            leading: Icon(
                              Icons.local_car_wash_rounded,
                              size: 30,
                            ),
                            title: Text(
                              'Normal Wash',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Nov 7',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '7000',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_car_wash_rounded,
                              size: 30,
                            ),
                            title: Text(
                              'Detailed Wash',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Dec 8',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '10000',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_car_wash_rounded,
                              size: 30,
                            ),
                            title: Text(
                              'Engine Wash',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Jan 2',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '9000',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_car_wash_rounded,
                              size: 30,
                            ),
                            title: Text(
                              'Interior Wash',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Feb 14',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '5000',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ))
              ],
            );
          } else {
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
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              'Chibueze Nnaemeka',
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
                                    'Warri, NG',
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 38, right: 38, top: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '17',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Transactions',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        width: 1,
                        height: 22,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5000',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Spent',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 33, right: 25, left: 25),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 33, right: 25, left: 25, bottom: 25),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Colors.black87
                              // fontWeight: FontWeight.bold
                              ),
                        ),
                      ),
                      Column(children: [
                        ListTile(
                          leading: Icon(
                            Icons.local_car_wash_rounded,
                            size: 30,
                          ),
                          title: Text(
                            'Normal Wash',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Nov 7',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            '7000',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_car_wash_rounded,
                            size: 30,
                          ),
                          title: Text(
                            'Detailed Wash',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Dec 8',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            '10000',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_car_wash_rounded,
                            size: 30,
                          ),
                          title: Text(
                            'Engine Wash',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Jan 2',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            '9000',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_car_wash_rounded,
                            size: 30,
                          ),
                          title: Text(
                            'Interior Wash',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Feb 14',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            '5000',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ))
              ],
            );
          }
        },
      ),
    );
  }
}
