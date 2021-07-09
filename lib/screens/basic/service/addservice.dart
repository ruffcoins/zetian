import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/service_helper.dart';
import 'package:zetian/models/service/create/create_new_service_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/service/viewservices.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> with ServiceHelper {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
              child: Icon(Icons.arrow_back_ios)),
          title: Center(
            child: Text(
              ' Add Service',
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
              // Tablet View

              return ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 700),
                          child: Card(
                            elevation: 10.0,
                            margin: EdgeInsets.only(
                                top: 30.0, left: 40.0, right: 40.0),
                            child: Container(
                                padding: EdgeInsets.all(40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Service Details',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: "SERVICE NAME",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: "AMOUNT",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => ServiceProfile(),
                            //     ));
                          },
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 700),
                            width: MediaQuery.of(context).size.width * 0.5,
                            // padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              elevation: 7.0,
                              // Register Button
                              child: Center(
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              //
              /// Mobile View
              //
              return ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 10.0,
                          margin: EdgeInsets.only(
                              top: 30.0, left: 40.0, right: 40.0),
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Service Details',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        labelText: "SERVICE NAME",
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                  TextField(
                                    controller: amountController,
                                    decoration: InputDecoration(
                                        labelText: "AMOUNT",
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            createService(
                                Provider.of<AppProvider>(context, listen: false)
                                    .dio,
                                CreateServiceRequest(
                                  name: nameController.text,
                                  amount: double.parse(amountController.text),
                                ),
                                Provider.of<AppProvider>(context, listen: false)
                                    .baseUrl,
                                context);

                            Provider.of<ServiceProvider>(context, listen: false)
                                    .isLoading
                                ? () {}
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewServices(),
                                    ));
                          },
                          child: Provider.of<ServiceProvider>(context,
                                      listen: false)
                                  .isLoading
                              ? Center(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30),
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator()))
                              : Container(
                                  padding:
                                      EdgeInsets.only(left: 40.0, right: 40.0),
                                  height: 40.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.greenAccent,
                                    color: Colors.green,
                                    elevation: 7.0,
                                    // Register Button
                                    child: Center(
                                      child: Text(
                                        'SAVE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      );
    });
  }
}
