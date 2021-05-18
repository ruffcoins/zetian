import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/basic/expense/expensedetail.dart';

class NewExpense extends StatefulWidget {
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

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
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpenseDetail(),
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
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "PURPOSE",
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
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "EMPLOYEE",
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
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
                                          borderSide:
                                              BorderSide(color: Colors.green))),
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
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExpenseDetail(),
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
          }
        },
      ),
    );
  }
}
