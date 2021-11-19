import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String? id;
  final String? title;
  final String? firstField;
  final String? secondField;
  final String? thirdField;

  /// Input Controllers
  TextEditingController firstFieldController = TextEditingController();
  TextEditingController secondFieldController = TextEditingController();
  TextEditingController thirdFieldController = TextEditingController();

  Cards(
      {this.id,
      this.title,
      this.firstField,
      this.secondField,
      this.thirdField});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.only(bottom: 20, top: 30.0, left: 40.0, right: 40.0),
      child: Container(
          padding:
              EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title!,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: firstFieldController,
                decoration: InputDecoration(
                    labelText: firstField,
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              TextField(
                controller: secondFieldController,
                decoration: InputDecoration(
                    labelText: secondField,
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              TextField(
                controller: thirdFieldController,
                decoration: InputDecoration(
                    labelText: thirdField,
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ],
          )),
    );
  }
}
