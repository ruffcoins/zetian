import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/models/customer/create/create_new_customer_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> with CustomerHelper {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController carRegController = TextEditingController();
  TextEditingController carMakeController = TextEditingController();
  TextEditingController carModelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(builder: (context, provider, child) {
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
              ' Add Customer',
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
            return ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 10.0,
                        margin:
                            EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
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
                                    'Personal Info',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                      labelText: "FIRSTNAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                      labelText: "LASTNAME",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                      labelText: "PHONE NUMBER",
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
                      Card(
                        elevation: 10.0,
                        margin:
                            EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
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
                                    'Car Details',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: carRegController,
                                  decoration: InputDecoration(
                                      labelText: "CAR REGISTERATION NUMBER",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: carMakeController,
                                  decoration: InputDecoration(
                                      labelText: "CAR MAKE",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  controller: carModelController,
                                  decoration: InputDecoration(
                                      labelText: "CAR MODEL",
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
                      SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () {
                          createCustomer(
                              Provider.of<AppProvider>(context, listen: false)
                                  .dio,
                              CreateCustomerRequest(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  phoneNumber: phoneController.text,
                                  carRegNo: carRegController.text,
                                  carMake: carMakeController.text,
                                  carModel: carModelController.text),
                              Provider.of<AppProvider>(context, listen: false)
                                  .baseUrl,
                              context);

                          Provider.of<CustomerProvider>(context, listen: false)
                                  .isLoading
                              ? () {}
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewCustomers(),
                                  ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
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
          },
        ),
      );
    });
  }
}
