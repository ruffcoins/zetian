import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/reports/expenses/expensereport.dart';
import 'package:zetian/screens/reports/sales/salesreport.dart';

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
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
            'Reports',
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
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SalesReport()));
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
                                    builder: (context) => ExpensesReport()));
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
                    SizedBox(height: 40.0),
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalesReport()));
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
                                builder: (context) => ExpensesReport()));
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         // Navigator.push(
                //         //     context,
                //         //     MaterialPageRoute(
                //         //         builder: (context) => ViewCustomers()));
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10.0),
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 2.0,
                //                 spreadRadius: 2.0,
                //                 color: Colors.black26,
                //                 offset: Offset(2, 3),
                //               )
                //             ]),
                //         margin: EdgeInsets.all(10.0),
                //         height: 120,
                //         width: MediaQuery.of(context).size.width * 0.43,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               Icons.person,
                //               size: 40.0,
                //               color: Colors.green,
                //             ),
                //             SizedBox(
                //               height: 14.0,
                //             ),
                //             Text(
                //               'Customers',
                //               style: TextStyle(
                //                 fontFamily: 'Montserrat',
                //                 color: Colors.green,
                //                 fontSize: 18.0,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {},
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10.0),
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 2.0,
                //                 spreadRadius: 2.0,
                //                 color: Colors.black26,
                //                 offset: Offset(2, 3),
                //               )
                //             ]),
                //         margin: EdgeInsets.all(10.0),
                //         height: 120,
                //         width: MediaQuery.of(context).size.width * 0.43,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               Icons.emoji_people,
                //               size: 40.0,
                //               color: Colors.green,
                //             ),
                //             SizedBox(
                //               height: 14.0,
                //             ),
                //             Text(
                //               'Employees',
                //               style: TextStyle(
                //                 fontFamily: 'Montserrat',
                //                 color: Colors.green,
                //                 fontSize: 18.0,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 40.0),
              ],
            );
          }
        },
      ),
    );
  }
}
