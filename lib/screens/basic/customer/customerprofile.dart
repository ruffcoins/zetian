import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/customer/update/add_car_to_customer_request.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/screens/basic/customer/updatecustomer.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';
import 'package:zetian/utils/string_extension.dart';

class CustomerProfile extends StatefulWidget {
  CustomerMessage customerDetails;

  CustomerProfile({required this.customerDetails});

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> with CustomerHelper {
  TextEditingController carRegNoController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carMakeController = TextEditingController();

  // @override
  // void initState() {
  //
  //   super.initState();
  // }
  String getSaleDate(String id) {
    String? result;
    for (var i = 0; i < widget.customerDetails.sale.length; i++) {
      for (var serviceID in widget.customerDetails.sale[i].serviceId) {
        if (serviceID == id) {
          result = widget.customerDetails.sale[i].date.toString();
        }
      }
    }
    return result ?? "empty";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: PopupMenuButton(
                elevation: 10,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 10, right: 30, left: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateCustomer(
                                    customerDetails: widget.customerDetails)));
                      },
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 30, right: 30, left: 30),
                    child: GestureDetector(
                      onTap: () async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: const Text(
                                  "Are you sure you wish to delete this item?"),
                              actions: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      deleteCustomer(
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .dio,
                                          widget.customerDetails.customer.id,
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .baseUrl,
                                          context);

                                      Provider.of<CustomerProvider>(context,
                                                  listen: false)
                                              .isLoading
                                          ? () {}
                                          : Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewCustomers(),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, right: 5),
                                      child: const Text("Delete",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 10),
                                    child: const Text("CANCEL"),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              //
              // Tablet View
              //
              return Column(
                children: [
                  // Name Section
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 28.0, top: 7.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/customer-image.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 38.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Chibueze Nnaemeka',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Warri, NG',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            wordSpacing: 4,
                                            letterSpacing: 2),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Next Section
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 38, right: 38, top: 15, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '17',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Transactions',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          width: 1,
                          height: 22,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '5000',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Spent',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          width: 1,
                          height: 22,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Cars',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(34))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: ListView(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 33, right: 25, left: 25),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 33, right: 25, left: 25, bottom: 25),
                            child: Text(
                              'Transactions',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  color: Colors.black87
                                  // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                          Column(children: [
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
                                '7000',
                                style: TextStyle(
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
                                'Detailed Wash',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Dec 8',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Text(
                                '10000',
                                style: TextStyle(
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
                                'Engine Wash',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Jan 2',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Text(
                                '9000',
                                style: TextStyle(
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
                                'Interior Wash',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Feb 14',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Text(
                                '5000',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ))
                ],
              );
            } else {
              //
              //Mobile View
              //
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: [
                      // Name Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 28.0, top: 7.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  'assets/images/customer-image.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    widget.customerDetails.customer.firstName
                                            .capitalize() +
                                        ' ' +
                                        widget.customerDetails.customer.lastName
                                            .capitalize(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Warri, NG',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              wordSpacing: 4,
                                              letterSpacing: 2),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // Next Section
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.customerDetails.transactionCount
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  'Transactions',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              width: 1,
                              height: 22,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₦' +
                                      widget.customerDetails.totalAmount
                                          .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  'Spent',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              width: 1,
                              height: 22,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.customerDetails.carCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  'Cars',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 17),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(34))),
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 33, right: 25, left: 25),
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 33, right: 25, left: 25, bottom: 25),
                              child: Text(
                                'Recent Services',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    color: Colors.black87
                                    // fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(bottom: 50),
                                  itemCount: widget
                                      .customerDetails.customerServices.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.local_car_wash_rounded,
                                        size: 30,
                                      ),
                                      title: Text(
                                        widget
                                            .customerDetails
                                            .customerServices[index]
                                            .name
                                            .capitalizeFirstofEach,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        getSaleDate(widget.customerDetails
                                            .customerServices[index].id),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      trailing: Text(
                                        widget.customerDetails
                                            .customerServices[index].amount
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Car',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: carRegNoController,
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
                                SizedBox(height: 30.0),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: GestureDetector(
                                    onTap: () {
                                      addCarToCustomer(
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .dio,
                                          widget.customerDetails.customer.id,
                                          AddCarToCustomerRequest(
                                            carRegNo: carRegNoController.text,
                                            carMake: carMakeController.text,
                                            carModel: carModelController.text,
                                          ),
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .baseUrl,
                                          context);

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Provider.of<CustomerProvider>(
                                                context,
                                                listen: false)
                                            .isLoading
                                        ? Center(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 30.0, bottom: 30),
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()))
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shadowColor:
                                                      Colors.greenAccent,
                                                  color: Colors.green,
                                                  elevation: 7.0,
                                                  // Register Button
                                                  child: Center(
                                                    child: Text(
                                                      'SAVE',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ]))
                    ],
                  );
                });
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
