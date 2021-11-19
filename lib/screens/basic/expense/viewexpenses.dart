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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
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
              //
              //Mobile View
              //
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          context.watch<EmployeeProvider>().isLoading
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  child: LinearProgressIndicator(color: Colors.white,)
                              )
                              : ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.green,
                                    primary: Colors.white,
                                    elevation: 20,
                                    minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.3,
                                      MediaQuery.of(context).size.height * 0.06,
                                    ),
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
                            label: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Center(
                                child: Text(
                                  'New Expense',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            icon: Icon(Icons.add),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.green,
                              primary: Colors.white,
                              elevation: 20,
                              minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.3,
                                MediaQuery.of(context).size.height * 0.06,
                              ),
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
                            label: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Center(
                                child: Text(
                                  'View all Expenses',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
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
          },
        ),
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

  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  void initState() {
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
            height: MediaQuery.of(context).size.height*0.72,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(34))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 23,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                provider.isLoading
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 30.0, bottom: 30),
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            )))
                    : Container(
                  height: MediaQuery.of(context).size.height * 0.625,
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
                                  size: 16,
                                ),
                                title: Text(
                                  provider.expenses[index].expense,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  formatter.format(provider.expenses[index].date).toString(),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Text(
                                  '₦' +
                                      provider.expenses[index].amount
                                          .toString(),
                                  textScaleFactor: 1.0,
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
