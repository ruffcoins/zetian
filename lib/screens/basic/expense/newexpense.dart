import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/expense_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/expense/create/create_new_expense_request.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/providers/expense_provider.dart';
import 'package:zetian/utils/dropdown.dart';
import 'package:zetian/utils/string_extension.dart';

class NewExpense extends StatefulWidget {
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> with ExpenseHelper {
  String? dropdownValue;
  List<String> employeeNames = [];
  List<String> employeeID = [];
  String selectedEmployeeID = '';
  List<Message> employees = [];

  @override
  void initState() {
    employees = Provider.of<EmployeeProvider>(context, listen: false).employees;

    for (var employee in employees) {
      employeeNames.add(employee.firstName.capitalize() +
          " " +
          employee.lastName.capitalize());
    }

    for (var employee in employees) {
      employeeID.add(employee.id);
    }
  }

  String findEmployeeID(String name) {
    int position = 0;

    for (int i = 0; i < employeeNames.length; i++) {
      if (name == employeeNames[i]) {
        position = i;
      }
    }

    return employeeID[position];
  }

  TextEditingController expenseController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  // TextEditingController dateController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(builder: (context, provider, child) {
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
              'New Expense',
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
                                        'Expense Details',
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
                                          labelText: "EXPENSE",
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
                                          labelText: "PURPOSE",
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
                        Container(
                          constraints: BoxConstraints(maxWidth: 700),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ExpenseDetail(),
                              //     ));
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
              return Stack(
                alignment: Alignment.center,
                children: [
                  ListView(
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
                                          'Expense Details',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        controller: expenseController,
                                        decoration: InputDecoration(
                                            labelText: "EXPENSE",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      TextField(
                                        controller: purposeController,
                                        decoration: InputDecoration(
                                            labelText: "PURPOSE",
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: DropdownType(
                                            model: 'EMPLOYEE',
                                            width: 0.7,
                                            dropdownValue:
                                                Provider.of<EmployeeProvider>(
                                                            context,
                                                            listen: false)
                                                        .isLoading
                                                    ? ""
                                                    : dropdownValue,
                                            objectList:
                                                Provider.of<EmployeeProvider>(
                                                            context,
                                                            listen: false)
                                                        .isLoading
                                                    ? []
                                                    : employeeNames,
                                            onChanged: (value) {
                                              dropdownValue = value;
                                              selectedEmployeeID =
                                                  findEmployeeID(value);
                                              // print(dropdownValue == null ? selectedEmployeeID : dropdownValue! + ": " + selectedEmployeeID);
                                              // print(expenseController.text + ": " +
                                              //     purposeController.text + ": " +
                                              //     amountController.text + ": " +
                                              //     dateController.text + ": " +
                                              //     selectedEmployeeID);
                                            }),
                                      )
                                      // TextField(
                                      //   controller: employeeController,
                                      //   decoration: InputDecoration(
                                      //       labelText: "EMPLOYEE",
                                      //       labelStyle: TextStyle(
                                      //           fontFamily: 'Montserrat',
                                      //           fontWeight: FontWeight.bold,
                                      //           color: Colors.grey),
                                      //       focusedBorder: UnderlineInputBorder(
                                      //           borderSide:
                                      //           BorderSide(color: Colors.green))),
                                      // ),
                                    ],
                                  )),
                            ),
                            SizedBox(height: 40.0),
                            GestureDetector(
                              onTap: () {
                                createExpense(
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .dio,
                                    CreateExpenseRequest(
                                      expense: expenseController.text,
                                      purpose: purposeController.text,
                                      amount: int.parse(amountController.text),
                                      date: dateController.text,
                                      employeeId: selectedEmployeeID,
                                    ),
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .baseUrl,
                                    context);

                                expenseController.text = '';
                                purposeController.text = '';
                                amountController.text = '';
                                dateController.text = '';
                                dropdownValue = null;

                                // Provider.of<ExpenseProvider>(context, listen: false)
                                //     .isLoading
                                //     ? () {}
                                //     : Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => ExpenseList(),
                                //     ));
                              },
                              child: Provider.of<ExpenseProvider>(context,
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
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 40.0),
                                      height: 40.0,
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                  ),
                  provider.isLoading
                      ? Container(
                          color: Colors.black38,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SpinKitPouringHourglass(
                            color: Colors.white,
                            size: 150,
                          ))
                      : Container()
                ],
              );
            }
          },
        ),
      );
    });
  }
}
