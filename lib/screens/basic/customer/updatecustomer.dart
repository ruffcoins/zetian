import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/customer_helper.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/customer/update/update_customer_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/screens/basic/customer/updatecustomercards.dart';
import 'package:zetian/screens/basic/customer/viewcustomers.dart';

// ignore: must_be_immutable
class UpdateCustomer extends StatefulWidget {
  Cards personalInfoCard = Cards(
      title: "PERSONAL DETAILS",
      firstField: "FIRST NAME",
      secondField: "LAST NAME",
      thirdField: "PHONE NUMBER");

  CustomerMessage customerDetails;

  UpdateCustomer({required this.customerDetails});

  @override
  _UpdateCustomerState createState() => _UpdateCustomerState();
}

class _UpdateCustomerState extends State<UpdateCustomer> with CustomerHelper {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<Cards> carsCards = [];

  @override
  void initState() {
    firstNameController.text = widget.customerDetails.customer.firstName;
    lastNameController.text = widget.customerDetails.customer.lastName;
    phoneNumberController.text = widget.customerDetails.customer.phoneNumber;

    widget.personalInfoCard.firstFieldController.text =
        firstNameController.text;
    widget.personalInfoCard.secondFieldController.text =
        lastNameController.text;
    widget.personalInfoCard.thirdFieldController.text =
        phoneNumberController.text;

    for (int i = 0; i < widget.customerDetails.cars.length; i++) {
      var tempCard = Cards(
          id: widget.customerDetails.cars[i].id,
          title: "CAR DETAILS",
          firstField: "CAR REGISTRATION NUMBER",
          secondField: "CAR MAKE",
          thirdField: "CAR MODEL");

      TextEditingController carRegNoController = TextEditingController();
      TextEditingController carMakeController = TextEditingController();
      TextEditingController carModelController = TextEditingController();

      carRegNoController.text = widget.customerDetails.cars[i].carRegNo;
      carMakeController.text = widget.customerDetails.cars[i].carMake;
      carModelController.text = widget.customerDetails.cars[i].carModel;

      tempCard.firstFieldController.text = carRegNoController.text;
      tempCard.secondFieldController.text = carMakeController.text;
      tempCard.thirdFieldController.text = carModelController.text;

      carsCards.add(tempCard);
    }

    super.initState();
  }

  List<CustomerCar> getCars() {
    List<CustomerCar> temp = [];

    CustomerCar oneCar = CustomerCar();

    for (var car in carsCards) {
      oneCar = CustomerCar(
          id: car.id,
          carRegNo: car.firstFieldController.text,
          carMake: car.secondFieldController.text,
          carModel: car.thirdFieldController.text);

      temp.add(oneCar);
    }

    return temp;
  }

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
              'Update Customer',
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
                  // Container(
                  //   constraints: BoxConstraints(maxWidth: 700),
                  //   height: MediaQuery.of(context).size.height * 0.8,
                  //   padding: EdgeInsets.only(bottom: 50),
                  //   child: ListView.builder(
                  //       itemCount: widget.cards.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Container(
                  //           child: widget.cards[index],
                  //         );
                  //       }),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             widget.cards.add(Cards(
                  //                 title: "Car Details",
                  //                 firstField: "CAR REGISTRATION NUMBER",
                  //                 secondField: "CAR MAKE",
                  //                 thirdField: "CAR MODEL"));
                  //           });
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(bottom: 20, left: 10),
                  //           color: Colors.green,
                  //           child: Icon(Icons.add, color: Colors.white),
                  //         )),
                  //     GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             if (widget.cards.length > 2) {
                  //               widget.cards.removeLast();
                  //             }
                  //           });
                  //         },
                  //         child: Container(
                  //             margin: EdgeInsets.only(bottom: 20, left: 10),
                  //             color: Colors.green,
                  //             child: Icon(Icons.remove, color: Colors.white))),
                  //   ],
                  // ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CustomerProfile(),
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
              /// Mobile View
              //
              return ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.41,
                          child: widget.personalInfoCard),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                            itemCount: carsCards.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: carsCards[index],
                              );
                            }),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(firstNameController.text);
                          updateCustomer(
                              Provider.of<AppProvider>(context, listen: false)
                                  .dio,
                              widget.customerDetails.customer.id,
                              UpdateCustomerRequest(
                                  firstName: widget.personalInfoCard
                                      .firstFieldController.text,
                                  lastName: widget.personalInfoCard
                                      .secondFieldController.text,
                                  phoneNumber: widget.personalInfoCard
                                      .thirdFieldController.text,
                                  customerCars: getCars()),
                              Provider.of<AppProvider>(context, listen: false)
                                  .baseUrl,
                              context);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewCustomers()),
                          );
                        },
                        child: Provider.of<CustomerProvider>(context,
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
