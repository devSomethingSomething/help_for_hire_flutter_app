// ignore_for_file: prefer_const_constructors
/// Imports
import 'package:flutter/material.dart';

/// Custom Drop down widget for the report page
class DropDownWidget extends StatefulWidget {
  /// Constructor
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

/// Getter for the drop down menu items
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Select Reason"), value: "Select"),
    DropdownMenuItem(
        child: Text("Inappropriate Behaviour"), value: "Inappropriate"),
    DropdownMenuItem(child: Text("Unethical"), value: "Unethical"),
    DropdownMenuItem(child: Text("Fraud"), value: "Fraud"),
    DropdownMenuItem(child: Text("Abusive"), value: "Abusive"),
  ];
  return menuItems;
}

class _DropDownWidgetState extends State<DropDownWidget> {
  /// Variables
  String selectedValue = "Select";

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: dropdownItems,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }
}
