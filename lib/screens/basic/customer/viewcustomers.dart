import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/screens/basic/customer/addcustomer.dart';
import 'package:zetian/screens/basic/customer/customerprofile.dart';
import 'package:zetian/utils/string_extension.dart';
import 'package:zetian/widgets/no_network.dart';

class ViewCustomers extends StatefulWidget {
  @override
  _ViewCustomersState createState() => _ViewCustomersState();
}

class _ViewCustomersState extends State<ViewCustomers> with CustomerHelper {
  bool customerList = true;
  List<GetCustomerResponse> customerResult = [];

  @override
  void initState() {
    getAllCustomers(Provider.of<AppProvider>(context, listen: false).dio,
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
      child: Consumer<CustomerProvider>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.green),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (Route<dynamic> route) => false);
                },
                child: Icon(Icons.arrow_back_ios)),
            title: Center(
              child: Text(
                'Customers',
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
                // If Customers list is empty show the empty customer screen
                if (customerList == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text(
                          'No Customers',
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
                  // If Customers list is not empty, show customer list
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
                              leading: Icon(Icons.person),
                              title: Text('Customer Name'),
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
                // If Customers list is empty show the empty customer screen
                if (customerList == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text(
                          'No Customers',
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
                  // If Customers list is not empty, show customer list
                  return Provider.of<CustomerProvider>(context, listen: true)
                          .isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 4,
                        ))
                      : provider.customers == null ? NoNetwork()
                      : RefreshIndicator(
                          onRefresh: () {
                            return Future.delayed(
                              Duration(seconds: 1), () async {
                              setState(() {
                                provider.updateIsLoading(true, true);
                              });
                              await getAllCustomers(Provider.of<AppProvider>(context, listen: false).dio,
                                  Provider.of<AppProvider>(context, listen: false).baseUrl, context);
                              setState(() {
                                provider.updateIsLoading(false, true);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Refreshing...")));
                            },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 70.0),
                            child: ListView.builder(
                              itemCount: provider.customers!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CustomerProfile(
                                                customerDetails:
                                                    provider.customers![index])));
                                  },
                                  child: Card(
                                    //                           <-- Card widget
                                    child: ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text(
                                        provider.customers![index].customer.firstName
                                                .capitalize() +
                                            ' ' +
                                            provider
                                                .customers![index].customer.lastName
                                                .capitalize(),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      );
                }
              }
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCustomer()));
            },
            label: Text(
              'New Customer',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
            ),
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      }),
    );
  }
}
