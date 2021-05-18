import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:zetian/partials/sidemenu.dart';

class GenerateSaleSummary extends StatefulWidget {
  @override
  _GenerateSaleSummaryState createState() => _GenerateSaleSummaryState();
}

class _GenerateSaleSummaryState extends State<GenerateSaleSummary> {
  bool reportList = true;

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
            'Sales Summary',
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
            return Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 700),
                child: Column(
                  children: [
                    Container(
                      // height: 100,
                      child: SfDateRangePicker(
                        view: DateRangePickerView.year,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        padding: EdgeInsets.only(left: 40.0, right: 40.0),
                        height: 40.0,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          // Register Button
                          child: Center(
                            child: Text(
                              'Generate Report',
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
              ),
            );
          } else {
            //
            // Mobile View
            //
            return Container(
              child: Column(
                children: [
                  Container(
                    // height: 100,
                    child: SfDateRangePicker(
                      view: DateRangePickerView.year,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                            'Generate Report',
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
            );
          }
        },
      ),
    );
  }
}
