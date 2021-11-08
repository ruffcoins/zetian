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
import 'package:zetian/screens/login.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Login(),
        // routes: {
        //   'dashboard'
        // },
      ),
    );
  }
}
