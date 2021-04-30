import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/service/addservice.dart';

class ViewServices extends StatefulWidget {
  @override
  _ViewServicesState createState() => _ViewServicesState();
}

class _ViewServicesState extends State<ViewServices> {
  bool serviceList = true;

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
              return Container(
                padding: EdgeInsets.only(bottom: 70.0),
                child: ListView.builder(
                  itemCount: 15,
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
  }
}
