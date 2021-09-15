import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/mixins/service_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/sale/newsale.dart';
import 'package:zetian/screens/basic/sale/saleslist.dart';

class ViewSales extends StatefulWidget {
  @override
  _ViewSalesState createState() => _ViewSalesState();
}

class _ViewSalesState extends State<ViewSales>
    with ServiceHelper, EmployeeHelper, CustomerHelper {
  List<String> employeeIDList = [];
  List<Message> employees = [];

  void initState() {
    employees = Provider.of<EmployeeProvider>(context, listen: false).employees;

    for (var employee in employees) {
      employeeIDList.add(employee.id);
    }

    getAllEmployees(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    getAllCustomers(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    getAllServices(Provider.of<AppProvider>(context, listen: false).dio,
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
        body: Column(
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
                        //   Text(
                        //     'Today',
                        //     style: TextStyle(
                        //       fontFamily: 'Montserrat',
                        //       fontSize: 20,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        //   Text(
                        //     '₦300000',
                        //     style: TextStyle(
                        //       fontFamily: 'Montserrat',
                        //       fontSize: 30,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
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
                        Provider.of<ServiceProvider>(context, listen: false)
                                .isLoading
                            ? () {}
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewSale(),
                                ));
                      },
                      label: Text(
                        'New Sale',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
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
                              builder: (context) => SalesList(),
                            ));
                      },
                      label: Text(
                        'View all Sales',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
                              '₦7000',
                              style: TextStyle(
                                  color: Colors.green,
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
        ));
  }
}
