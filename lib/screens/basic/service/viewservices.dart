import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/service_helper.dart';
import 'package:zetian/models/service/read/get_service_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/service/addservice.dart';
import 'package:zetian/screens/basic/service/serviceprofile.dart';
import 'package:zetian/utils/string_extension.dart';

class ViewServices extends StatefulWidget {
  @override
  _ViewServicesState createState() => _ViewServicesState();
}

class _ViewServicesState extends State<ViewServices> with ServiceHelper {
  bool serviceList = true;
  List<GetServiceResponse> serviceResult = [];

  @override
  void initState() {
    getAllServices(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(Icons.arrow_back_ios),
              )),
          title: Center(
            child: Text(
              'Services',
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
              // If service list is empty show the empty service screen
              if (serviceList == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      Text(
                        'No Services',
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
                // If service list is not empty, show service list
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
                              Icons.home_repair_service,
                              size: 25,
                            ),
                            title: Text(
                              'Service Name',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            trailing: Text(
                              '5000',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
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
              // If service list is empty show the empty service screen
              if (serviceList == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      Text(
                        'No Services',
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
                // If Service list is not empty, show service list
                return Provider.of<ServiceProvider>(context, listen: true)
                        .isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ))
                    : Container(
                        padding: EdgeInsets.only(bottom: 70.0),
                        child: ListView.builder(
                          itemCount: provider.services.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ServiceProfile(
                                            serviceDetails:
                                                provider.services[index])));
                              },
                              child: Card(
                                //                           <-- Card widget
                                child: ListTile(
                                  leading: Icon(
                                    Icons.home_repair_service,
                                    size: 25,
                                  ),
                                  title: Text(
                                    provider.services[index].name.capitalize(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  trailing: Text(
                                    '₦' +
                                        provider.services[index].amount
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddService()));
          },
          label: Text(
            'New Service',
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
    });
  }
}
