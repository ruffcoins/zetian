import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/expense_helper.dart';
import 'package:zetian/models/expense/read/get_expense_response.dart';
import 'package:zetian/providers/expense_provider.dart';
import 'package:zetian/utils/string_extension.dart';

class ExpenseDetail extends StatefulWidget {
  Message expenseDetails;

  ExpenseDetail({required this.expenseDetails});

  @override
  _ExpenseDetailState createState() => _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetail> with ExpenseHelper {
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
            //
            //Mobile View
            //
            return context.watch<ExpenseProvider>().isLoading
                ? Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 30.0, bottom: 30),
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        )))
                : Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Expense Details',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Next Section
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.expenseDetails.id,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Expense',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.expenseDetails.expense.capitalize(),
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Purpose',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.expenseDetails.purpose
                                        .capitalizeFirstofEach,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Amount',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₦' +
                                        widget.expenseDetails.amount.toString(),
                              textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Employee',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.expenseDetails.employeeName
                                        .capitalizeFirstofEach,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Date',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              formatter.format(widget.expenseDetails.date).toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            );
        },
      ),
    );
  }
}
