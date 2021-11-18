import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/sale_helper.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/sale_provider.dart';
import 'package:zetian/screens/basic/sale/saledetail.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> with SaleHelper {
  bool salesList = true;

  // List<GetSaleResponse> saleResult = [];
  List<String> customerIDList = [];
  List<String> customerCarRegNo = [];
  List<SalesResult> sales = [];
  List<CustomerMessage> customers = [];

  @override
  void initState() {
    getAllSales(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    sales = Provider.of<SaleProvider>(context, listen: false).sales;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SaleProvider>(builder: (context, provider, child) {
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
              'Sales List',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Montserrat',
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              //
              // Tablet View
              //
              // If Sales list is empty show the empty sales screen
              if (salesList == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      Text(
                        'No Sales',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 28.0,
                        ),
                      ),
                      Icon(
                        Icons.error,
                        color: Colors.black38,
                        size: 50.0,
                      )
                    ],
                  ),
                );
              } else {
                // If Sales list is not empty, show sales list
                return Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                    constraints: BoxConstraints(maxWidth: 600),
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Card(
                          //                           <-- Card widget
                          child: ListTile(
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
                        );
                      },
                    ),
                  ),
                );
              }
            } else {
              //
              // Mobile View
              //
              // If Sales list is empty show the empty sales screen
              if (salesList == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      Text(
                        'No Sales',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 28.0,
                        ),
                      ),
                      Icon(
                        Icons.error,
                        color: Colors.black38,
                        size: 50.0,
                      )
                    ],
                  ),
                );
              } else {
                // If Sales list is not empty, show sales list
                return Provider.of<SaleProvider>(context, listen: true)
                        .isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ))
                    : Container(
                        // padding: EdgeInsets.only(bottom: 70.0),
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
                                  leading: Icon(
                                    Icons.local_car_wash_rounded,
                                    size: 30,
                                  ),
                                  title: Text(
                                    // provider.sales[index]..capitalize(),
                                    provider.sales[index].car.carRegNo,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    provider.sales[index].sale.date.toString(),
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
              }
            }
          },
        ),
      );
    });
  }
}
