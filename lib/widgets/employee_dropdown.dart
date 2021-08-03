import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/employee_helper.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/providers/employee_provider.dart';
import 'package:zetian/utils/dropdown.dart';
import 'package:zetian/utils/string_extension.dart';

class EmployeeDropdown extends StatefulWidget {
  String? dropdownValue;
  String? selectedEmployeeID;

  EmployeeDropdown({Key? key}) : super(key: key);

  @override
  _EmployeeDropdownState createState() => _EmployeeDropdownState();
}

class _EmployeeDropdownState extends State<EmployeeDropdown>
    with EmployeeHelper {
  List<String> employeeNames = [];
  List<String> employeeID = [];
  List<Message> employees = [];

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
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return DropdownType(
      model: 'EMPLOYEE',
      width: 0.7,
      dropdownValue: widget.dropdownValue,
      objectList: employeeNames,
      onChanged: (value) {
        widget.dropdownValue = value;
        widget.selectedEmployeeID = findEmployeeID(value);
        print(widget.dropdownValue == null
            ? widget.selectedEmployeeID
            : widget.dropdownValue! + ": " + widget.selectedEmployeeID!);
        // print(expenseController.text + ": " +
        //     purposeController.text + ": " +
        //     amountController.text + ": " +
        //     dateController.text + ": " +
        //     selectedEmployeeID);
      },
      // onTap: (){
      //   getAllEmployees(Provider.of<AppProvider>(context, listen: false).dio,
      //       Provider.of<AppProvider>(context, listen: false).baseUrl, context);
      //
      // },
    );
  }
}
