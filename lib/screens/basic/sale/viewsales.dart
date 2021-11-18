import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/mixins/sale_helper.dart';
import 'package:zetian/mixins/service_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/sale_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/sale/newsale.dart';
import 'package:zetian/screens/basic/sale/saledetail.dart';
import 'package:zetian/screens/basic/sale/saleslist.dart';

class ViewSales extends StatefulWidget {
  @override
  _ViewSalesState createState() => _ViewSalesState();
}

class _ViewSalesState extends State<ViewSales>
    with ServiceHelper, EmployeeHelper, CustomerHelper, SaleHelper {
  List<String> employeeIDList = [];
  List<Message> employees = [];
  List<SalesResult> salesList = [];

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

    getAllSales(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    salesList = Provider.of<SaleProvider>(context, listen: false).sales;

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
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        Provider.of<ServiceProvider>(context, listen: false)
                            .isLoading
                            &&
                        Provider.of<EmployeeProvider>(context, listen: false)
                            .isLoading
                            &&
                        Provider.of<SaleProvider>(context, listen: false)
                            .isLoading
                            &&
                        Provider.of<CustomerProvider>(context, listen: false)
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
                        textScaleFactor: 1.0,
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
                              builder: (context) => SalesList(),
                            ));
                      },
                      label: Text(
                        'View all Sales',
                        textScaleFactor: 1.0,
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
              child: Column(
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
                  Consumer<SaleProvider>(builder: (context, provider, child){
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.634,
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: provider.sales.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SaleDetail(
                                          saleDetails:
                                          provider.sales[index])));
                            },
                            child: Card(
                              //                           <-- Card widget
                              child: ListTile(
                                title: Text(
                                  // provider.sales[index]..capitalize(),
                                  provider.sales[index].car.carRegNo,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  provider.sales[index].sale.date.toString().substring(0, provider.sales[index].sale.date.toString().length - 13),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Text(
                                  '₦' +
                                      provider.sales[index].sale.totalAmount
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ))
          ],
        ));
  }
}
