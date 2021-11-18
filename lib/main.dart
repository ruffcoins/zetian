import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/providers/dashboard_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/expense_provider.dart';
import 'package:zetian/providers/sale_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/providers/user_provider.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';
import 'package:zetian/screens/basic/dashboard.dart';
import 'package:zetian/screens/basic/employee/viewemployees.dart';
import 'package:zetian/screens/basic/expense/viewexpenses.dart';
import 'package:zetian/screens/basic/sale/viewsales.dart';
import 'package:zetian/screens/basic/service/viewservices.dart';
import 'package:zetian/screens/basic/users/userlist.dart';
import 'package:zetian/screens/login.dart';
import 'package:zetian/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => SaleProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: Login(),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => Login(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/dashboard': (context) => Dashboard(),
          '/register': (context) => Register(),
          '/customers': (context) => ViewCustomers(),
          '/services': (context) => ViewServices(),
          '/sales': (context) => ViewSales(),
          '/expenses': (context) => ViewExpense(),
          '/users': (context) => ViewUsers(),
          '/employees': (context) => ViewEmployees(),
        },
      ),
    );
  }
}
