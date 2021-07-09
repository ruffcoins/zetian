import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownType extends StatefulWidget {
  String? dropdownValue = '';
  List<String> objectList;
  String? current = '';
  Function onChanged;
  Function? onTap;
  bool? needTap;
  double width;

  DropdownType({
    required this.dropdownValue,
    required this.objectList,
    required this.onChanged,
    this.onTap,
    this.needTap,
    this.width = 0.2,
  });

  String getCurrentValue() {
    return current!;
  }

  @override
  _DropdownTypeState createState() =>
      _DropdownTypeState(); // dropdownValue: firstVal, objectList: objects);
}

/// This dropdown class fetches from the backend- the list of owners.
class _DropdownTypeState extends State<DropdownType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.green,
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.green,
        //focusColor: HexColor('D6E3F8'),
        value: widget.dropdownValue!,
        icon: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Icon(Icons.arrow_downward),
        ),
        iconSize: 20,
        elevation: 16,
        underline: Container(
          height: 0,
        ),
        isExpanded: true,
        style: TextStyle(
          color: Colors.white,
          decorationColor: Colors.white,
        ),
        onChanged: (String? newValue) {
          widget.onChanged(newValue);
          setState(() {
            widget.dropdownValue = newValue;
            widget.current = newValue;
          });
        },
        onTap: () {},
        //widget.onTap!(),
        items: widget.objectList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
