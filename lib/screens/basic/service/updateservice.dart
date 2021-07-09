import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/service_helper.dart';
import 'package:zetian/models/service/read/get_service_response.dart';
import 'package:zetian/models/service/update/update_service_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/service/viewservices.dart';
import 'package:zetian/utils/string_extension.dart';

class UpdateService extends StatefulWidget {
  Message serviceDetails;

  UpdateService({required this.serviceDetails});

  @override
  _UpdateServiceState createState() => _UpdateServiceState();
}

class _UpdateServiceState extends State<UpdateService> with ServiceHelper {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.serviceDetails.name.capitalizeFirstofEach;
    amountController.text = widget.serviceDetails.amount.toString();
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
              child: Icon(Icons.arrow_back_ios)),
          title: Center(
            child: Text(
              'Update Service',
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
              return Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 700),
                    child: Card(
                      elevation: 10.0,
                      margin: EdgeInsets.only(
                          top: 30.0, left: 40.0, right: 40.0, bottom: 30),
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
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    labelText: "AMOUNT",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            ],
                          )),
                    ),
                  ),
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
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        // Register Button
                        child: Center(
                          child: Text(
                            'UPDATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              //
              // Mobile View
              //
              return ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 10.0,
                        margin: EdgeInsets.only(
                            top: 30.0, left: 40.0, right: 40.0, bottom: 30),
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      labelText: "SERVICE NAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
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
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          updateService(
                              Provider.of<AppProvider>(context, listen: false)
                                  .dio,
                              widget.serviceDetails.id,
                              UpdateServiceRequest(
                                name: nameController.text.toLowerCase(),
                                amount: double.parse(amountController.text),
                              ),
                              Provider.of<AppProvider>(context, listen: false)
                                  .baseUrl,
                              context);

                          Navigator.pushReplacement(
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
                                    margin:
                                        EdgeInsets.only(top: 30.0, bottom: 30),
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()))
                            : Container(
                                margin: EdgeInsets.only(top: 10.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  // Register Button
                                  child: Center(
                                    child: Text(
                                      'UPDATE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
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
