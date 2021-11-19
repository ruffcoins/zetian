import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/sale_helper.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/sale/create/create_new_sale_request.dart';
import 'package:zetian/models/service/read/get_service_response.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/sale_provider.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/screens/basic/sale/viewsales.dart';
import 'package:zetian/utils/string_extension.dart';
import 'package:zetian/widgets/employee_dropdown.dart';

class NewSale extends StatefulWidget {
  @override
  _NewSaleState createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> with SaleHelper {
  String? dropdownValue;
  String? selectedEmployeeID;
  List<String> serviceNames = [];
  List<int> serviceAmounts = [];
  List<String> serviceID = [];
  String selectedServiceID = '';
  List<Message> services = [];
  List<CustomerMessage> _customers = [];
  List<bool> buttonValue = [];
  String carRegNo = '';
  List<String> carRegNoList = [];
  List<Map<String, String>> _customerInfo = [];
  List<String> selectedServices = [];
  TextEditingController serviceTotalController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();

  late EmployeeDropdown employeeDropdown = new EmployeeDropdown();

  @override
  void initState() {
    _customers =
        Provider.of<CustomerProvider>(context, listen: false).customers ?? [];
    services = Provider.of<ServiceProvider>(context, listen: false).services ?? [];
    serviceTotalController.text = "0";

    for (var service in services) {
      serviceNames.add(service.name.capitalizeFirstofEach);
      serviceAmounts.add(service.amount);
    }

    for (var customer in _customers) {
      print(customer.customer.firstName);
      for (int i = 0; i < customer.cars.length; i++) {
        print(customer.cars[i].carRegNo);
        carRegNoList.add(customer.cars[i].carRegNo);

        String customerName =
            customer.customer.firstName + " " + customer.customer.lastName;
        Map<String, String> customerTempInfo = {
          customerName: customer.customer.phoneNumber
        };
        _customerInfo.add(customerTempInfo);
      }
    }

    for (var service in services) {
      serviceID.add(service.id);
    }

    for (int i = 0; i < services.length; i++) {
      buttonValue.add(false);
    }
  }

  String findServiceID(String name) {
    int position = 0;

    for (int i = 0; i < serviceNames.length; i++) {
      if (name == serviceNames[i]) {
        position = i;
      }
    }

    return serviceID[position];
  }

  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
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
              ' New Sale',
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
              return ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 700),
                          child: Card(
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
                                        'Customer Info',
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
                                          labelText: "CAR REGISTRATION NUMBER",
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
                                          labelText: "PHONE NUMBER",
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
                                          labelText: "CUSTOMER NAME",
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
                        Container(
                          constraints: BoxConstraints(maxWidth: 700),
                          child: Card(
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
                                        'Sale Details',
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
                                          labelText: "SERVICE(S)",
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
                                          labelText: "TOTAL",
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
                                          labelText: "EMPLOYEE",
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                    ),
                                    TextField(
                                      readOnly: true,
                                      controller: dateController,
                                      decoration: InputDecoration(
                                          hintText: 'DATE',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green))),
                                      onTap: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        dateController.text =
                                            date.toString().substring(0, 10);
                                      },
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
                            //       builder: (context) => SaleDetail(),
                            //     ));
                          },
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 700),
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
            } else {
              //
              // Mobile View
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
                                      'Customer Info',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownSearch(
                                    hint: "SELECT CAR REGISTRATION NUMBER",
                                    items: carRegNoList,
                                    showSearchBox: true,
                                    onChanged: (String? value) {
                                      int carRegNoIndex =
                                          carRegNoList.indexOf(value!);
                                      carRegNo = value;
                                      String name = _customerInfo[carRegNoIndex]
                                          .keys
                                          .first;
                                      String phone =
                                          _customerInfo[carRegNoIndex][name]!;
                                      customerNameController.text = name;
                                      customerPhoneController.text = phone;
                                    },
                                  ),
                                  TextField(
                                    controller: customerPhoneController,
                                    decoration: InputDecoration(
                                        labelText: "PHONE NUMBER",
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                  TextField(
                                    controller: customerNameController,
                                    decoration: InputDecoration(
                                        labelText: "CUSTOMER NAME",
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
                                      'Sale Details',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // TextField(
                                  //   decoration: InputDecoration(
                                  //       labelText: "SERVICE(S)",
                                  //       labelStyle: TextStyle(
                                  //           fontFamily: 'Montserrat',
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.grey),
                                  //       focusedBorder: UnderlineInputBorder(
                                  //           borderSide:
                                  //           BorderSide(color: Colors.green))),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 8.0),
                                  //   child: DropdownType(
                                  //     model: 'SERVICE',
                                  //       width: 0.7,
                                  //       dropdownValue:
                                  //       Provider.of<ServiceProvider>(
                                  //           context,
                                  //           listen: false)
                                  //           .isLoading
                                  //           ? ""
                                  //           : dropdownValue,
                                  //       objectList:
                                  //       Provider.of<ServiceProvider>(
                                  //           context,
                                  //           listen: false)
                                  //           .isLoading
                                  //       ? []
                                  //           : serviceNames,
                                  //       onChanged: (value) {
                                  //         dropdownValue = value;
                                  //         selectedServiceID =
                                  //             findServiceID(value);
                                  //         // print(dropdownValue == null ? selectedServiceID : dropdownValue! + ": " + selectedServiceID);
                                  //         // print(expenseController.text + ": " +
                                  //         //     purposeController.text + ": " +
                                  //         //     amountController.text + ": " +
                                  //         //     dateController.text + ": " +
                                  //         //     selectedServiceID);
                                  //       }),
                                  // ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: ListView.builder(
                                        itemCount: services.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            title: Text(
                                              services[index]
                                                  .name
                                                  .capitalizeFirstofEach,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            value: buttonValue[index],
                                            onChanged: (bool? value) {
                                              if (value == true) {
                                                selectedServices.add(
                                                    services[index]
                                                        .name
                                                        .capitalizeFirstofEach);
                                                int tempPrice = int.parse(
                                                    serviceTotalController
                                                        .text);
                                                tempPrice +=
                                                    services[index].amount;
                                                setState(() {
                                                  buttonValue[index] = value!;
                                                  serviceTotalController.text =
                                                      tempPrice.toString();
                                                });
                                              } else {
                                                selectedServices.remove(
                                                    services[index]
                                                        .name
                                                        .capitalizeFirstofEach);
                                                int tempPrice = int.parse(
                                                    serviceTotalController
                                                        .text);
                                                tempPrice -=
                                                    services[index].amount;
                                                setState(() {
                                                  buttonValue[index] = value!;
                                                  serviceTotalController.text =
                                                      tempPrice.toString();
                                                });
                                              }
                                            },
                                          );
                                        }),
                                  ),
                                  TextField(
                                    // enabled: false,
                                    controller: serviceTotalController,
                                    decoration: InputDecoration(
                                        labelText: "TOTAL",
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                  Provider.of<EmployeeProvider>(context,
                                              listen: false)
                                          .isLoading
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              top: 30.0, bottom: 10),
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ))
                                      : employeeDropdown,
                                  TextField(
                                    readOnly: true,
                                    controller: dateController,
                                    decoration: InputDecoration(
                                        hintText: 'DATE',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100));
                                      dateController.text =
                                          date.toString().substring(0, 10);
                                    },
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            createSale(
                                Provider.of<AppProvider>(context, listen: false)
                                    .dio,
                                CreateSaleRequest(
                                    carRegNo: carRegNo,
                                    services: selectedServices,
                                    employeeId:
                                        employeeDropdown.selectedEmployeeID!,
                                    date: dateController.text),
                                Provider.of<AppProvider>(context, listen: false)
                                    .baseUrl,
                                context);
                            Provider.of<SaleProvider>(context, listen: false)
                                    .isLoading
                                ? () {}
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewSales(),
                                    ));
                          },
                          child: Provider.of<SaleProvider>(context,
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