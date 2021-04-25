import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var selectedItem = 'Services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green),
          title: Center(
            child: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Montserrat',
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
          ),
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
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth >= 768) {
            // Tablet View
            return ListView(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                  child: Container(
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildItem('Services', 20),
                        _buildItem('Sales', 17),
                        _buildItem('Customers', 9),
                        _buildItem('Employees', 4)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Customers',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_repair_service,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Services',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Sales',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.show_chart,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Reports',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_people,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Employees',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
              ],
            );
          } else {
            // Mobile View
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                  child: Container(
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildItem('Services', 20),
                        _buildItem('Sales', 17),
                        _buildItem('Customers', 9),
                        _buildItem('Employees', 4)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Customers',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_repair_service,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Services',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Sales',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.show_chart,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Reports',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Colors.black26,
                              offset: Offset(2, 3),
                            )
                          ]),
                      margin: EdgeInsets.all(10.0),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_people,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Employees',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
              ],
            );
          }
        }));
  }

  _buildItem(String name, int count) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0, bottom: 10.0, left: 4.0, top: 10.0),
      child: GestureDetector(
        onTap: () {
          selectedDashboardItem(name);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: switchHighlight(name),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    color: switchShadow(name),
                    offset: Offset(2, 3))
              ]),
          height: 50.0,
          width: 125.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: switchHighlightColor(name),
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: switchHighlightColor(name),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  selectedDashboardItem(dashboardItem) {
    setState(() {
      selectedItem = dashboardItem;
    });
  }

  switchHighlight(dashboardItem) {
    if (dashboardItem == selectedItem) {
      return Colors.green;
    } else {
      return Colors.grey.withOpacity(0.3);
    }
  }

  switchHighlightColor(dashboardItem) {
    if (dashboardItem == selectedItem) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  switchShadow(dashboardItem) {
    if (dashboardItem == selectedItem) {
      return Colors.greenAccent;
    } else {
      return Colors.transparent;
    }
  }
}
