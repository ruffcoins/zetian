import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/mixins/expense_helper.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/expense_provider.dart';
import 'package:zetian/screens/basic/expense/expensedetail.dart';
import 'package:zetian/screens/basic/expense/expenselist.dart';
import 'package:zetian/screens/basic/expense/newexpense.dart';

class ViewExpense extends StatefulWidget {
  @override
  _ViewExpenseState createState() => _ViewExpenseState();
}

class _ViewExpenseState extends State<ViewExpense>
    with EmployeeHelper, ExpenseHelper {
  void initState() {
    getAllEmployees(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    super.initState();
  }

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
      ),
      endDrawer: SideMenu(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 768) {
            //
            // Tablet View
            //
            return Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This Week',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₦950000',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Today',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₦300000',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.green,
                            primary: Colors.white,
                            elevation: 20,
                            minimumSize: Size(100, 40),
                            shadowColor: Colors.black26,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewExpense(),
                                ));
                          },
                          label: Text(
                            'New Expense',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          icon: Icon(Icons.add),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.green,
                            primary: Colors.white,
                            elevation: 20,
                            minimumSize: Size(100, 40),
                            shadowColor: Colors.black26,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpenseList(),
                                ));
                          },
                          label: Text(
                            'View all Expenses',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          icon: Icon(Icons.list_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
                // Next Section
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
                        padding: EdgeInsets.only(top: 30, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Recent Transactions',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 23,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'Data',
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
                                  '₦1500',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'New Equipment',
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
                                  '₦20000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'Rent',
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
                                  '₦10000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'Salary',
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
                                  '₦100000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'Detergent',
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
                                  '₦1000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  'Repairs',
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
                                  '₦9000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                    ],
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
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'This Week',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // Text(
                            //   '₦950000',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 30,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'Today',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // Text(
                            //   '₦300000',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 30,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        context.watch<EmployeeProvider>().isLoading
                            ? Center(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(top: 30.0, bottom: 10),
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )))
                            : ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.green,
                                  primary: Colors.white,
                                  elevation: 20,
                                  minimumSize: Size(40, 40),
                                  shadowColor: Colors.black26,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  Provider.of<EmployeeProvider>(context,
                                              listen: false)
                                          .isLoading
                                      ? () {}
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewExpense(),
                                          ));
                                },
                          label: Text(
                            'New Expense',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          icon: Icon(Icons.add),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.green,
                            primary: Colors.white,
                            elevation: 20,
                            minimumSize: Size(100, 40),
                            shadowColor: Colors.black26,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpenseList(),
                                ));
                          },
                          label: Text(
                            'View all Expenses',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          icon: Icon(Icons.list_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
                // Next Section
                RecentTransactions()
              ],
            );
          }
        },
      ),
    );
  }
}

class RecentTransactions extends StatefulWidget {
  @override
  _RecentTransactionsState createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions>
    with ExpenseHelper {
  @override
  void initState() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate); //  2021-08-03

    getAllExpenses(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    // getRecentExpenses(
    //     Provider.of<AppProvider>(context, listen: false).dio,
    //     Provider.of<AppProvider>(context, listen: false).baseUrl,
    //     context
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(builder: (context, provider, child) {

      /// Dynamic
      return Expanded(
        child: Container(
          // height: MediaQuery.of(context).size.height*0.8,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(34))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 23,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                context.watch<ExpenseProvider>().isLoading
                    ? Center(
                        child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 30.0, bottom: 30),
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              )),
                        ],
                      ))
                    : Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                        // padding: EdgeInsets.only(bottom: 70.0),
                        child: ListView.builder(
                          itemCount: provider.expenses.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExpenseDetail(
                                            expenseDetails:
                                                provider.expenses[index])));
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                ),
                                title: Text(
                                  provider.expenses[index].expense,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  provider.expenses[index].date.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Text(
                                  '₦' +
                                      provider.expenses[index].amount
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              // ListTile(
                              //   leading: Icon(
                              //     Icons.home_repair_service,
                              //     size: 25,
                              //   ),
                              //   title: Text(
                              //     provider.expenses[index].expense,
                              //     style: TextStyle(
                              //         fontFamily: 'Montserrat',
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 18),
                              //   ),
                              //   trailing: Text(
                              //     provider.expenses[index].amount.toString(),
                              //     style: TextStyle(
                              //         fontFamily: 'Montserrat',
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16),
                              //   ),
                              // ),
                            );
                          },
                        ),
                      ),
              ],
            )),
      );
    });
  }
}
