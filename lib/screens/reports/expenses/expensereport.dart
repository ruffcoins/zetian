import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/reports/expenses/generateexpensedetail.dart';
import 'package:zetian/screens/reports/expenses/generateexpensesummary.dart';

class ExpensesReport extends StatefulWidget {
  @override
  _ExpensesReportState createState() => _ExpensesReportState();
}

class _ExpensesReportState extends State<ExpensesReport> {
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
            'Expenses Reports',
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
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenerateExpenseSummary(),
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
                                Icons.summarize_rounded,
                                size: 40.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                'Summary',
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
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenerateExpenseDetail(),
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
                                Icons.apps_rounded,
                                size: 40.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                'Detailed',
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
          ;
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
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenerateExpenseSummary(),
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
                            Icons.summarize_rounded,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Summary',
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
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenerateExpenseDetail(),
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
                            Icons.apps_rounded,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Detailed',
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
      }),
    );
  }
}
