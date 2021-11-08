import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/dashboard_helper.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/dashboard_provider.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';
import 'package:zetian/screens/basic/employee/viewemployees.dart';
import 'package:zetian/screens/basic/expense/viewexpenses.dart';
import 'package:zetian/screens/basic/reports/reportlist.dart';
import 'package:zetian/screens/basic/sale/viewsales.dart';
import 'package:zetian/screens/basic/service/viewservices.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with DashboardHelper {
  var selectedItem = 'Services';
  DashboardMessage? result;

  @override
  void initState(){
    // print(result!.message.employeeCount.toString());
    getDashboardValues();
    super.initState();
  }

  void getDashboardValues() async{
    await getDashboard(Provider.of<AppProvider>(context, listen: false).dio,Provider.of<AppProvider>(context, listen: false).baseUrl, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      result = provider.result;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.green),
            title: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Montserrat',
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          endDrawer: SideMenu(),
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              // Tablet View
              return ListView(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                    child: Container(
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildItem('Services', provider.result!.serviceCount),
                          _buildItem('Sales', provider.result!.salesCount),
                          _buildItem(
                              'Customers', provider.result!.customersCount),
                          _buildItem(
                              'Employees', provider.result!.employeeCount)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Customers Button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewCustomers()));
                        },
                        child: Container(
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
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewServices()));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewSales()));
                        },
                        child: Container(
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
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewExpense()));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportList(),
                              ));
                        },
                        child: Container(
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
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewEmployees(),
                              ));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                ],
              );
            } else {
              // Mobile View
              return Provider.of<DashboardProvider>(context, listen: true)
                      .isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ))
                  : ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 15.0, bottom: 15.0),
                          child: Container(
                            height: 100.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildItem('Services',
                                    provider.result?.salesCount ?? 0),
                                _buildItem(
                                    'Sales', provider.result?.salesCount ?? 0),
                                _buildItem('Customers',
                                    provider.result?.customersCount ?? 0),
                                _buildItem('Employees',
                                    provider.result?.employeeCount ?? 0)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewCustomers()));
                              },
                              child: Container(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewServices()));
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewSales()));
                              },
                              child: Container(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewExpense()));
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportList(),
                                    ));
                              },
                              child: Container(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewEmployees(),
                                    ));
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                      ],
                    );
            }
          }));
    });
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
