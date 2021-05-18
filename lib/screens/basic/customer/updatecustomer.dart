import 'package:flutter/material.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/screens/basic/customer/customerprofile.dart';
import 'package:zetian/screens/basic/customer/updatecustomercards.dart';

// ignore: must_be_immutable
class UpdateCustomer extends StatefulWidget {
  List<Cards> cards = [
    Cards(
        title: "PERSONAL DETAILS",
        firstField: "FIRST NAME",
        secondField: "LAST NAME",
        thirdField: "PHONE NUMBER"),
    Cards(
        title: "CAR DETAILS",
        firstField: "CAR REGISTRATION NUMBER",
        secondField: "CAR MAKE",
        thirdField: "CAR MODEL")
  ];

  @override
  _UpdateCustomerState createState() => _UpdateCustomerState();
}

class _UpdateCustomerState extends State<UpdateCustomer> {
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
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: EdgeInsets.only(bottom: 50),
                  child: ListView.builder(
                      itemCount: widget.cards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: widget.cards[index],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.cards.add(Cards(
                                title: "Car Details",
                                firstField: "CAR REGISTRATION NUMBER",
                                secondField: "CAR MAKE",
                                thirdField: "CAR MODEL"));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20, left: 10),
                          color: Colors.green,
                          child: Icon(Icons.add, color: Colors.white),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.cards.length > 2) {
                              widget.cards.removeLast();
                            }
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 10),
                            color: Colors.green,
                            child: Icon(Icons.remove, color: Colors.white))),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerProfile(),
                        ));
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                          itemCount: widget.cards.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: widget.cards[index],
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.cards.add(Cards(
                                    title: "Car Details",
                                    firstField: "CAR REGISTRATION NUMBER",
                                    secondField: "CAR MAKE",
                                    thirdField: "CAR MODEL"));
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
                              color: Colors.green,
                              child: Icon(Icons.add, color: Colors.white),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (widget.cards.length > 2) {
                                  widget.cards.removeLast();
                                }
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                color: Colors.green,
                                child:
                                    Icon(Icons.remove, color: Colors.white))),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerProfile(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        height: MediaQuery.of(context).size.height * 0.05,
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
  }
}
