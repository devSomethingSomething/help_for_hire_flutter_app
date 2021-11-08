

import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Select Reason"), value: "Select"),
    DropdownMenuItem(child: Text("Inappropriate Behaviour"), value: "Inappropriate"),
    DropdownMenuItem(child: Text("Unethical"), value: "Unethical"),
    DropdownMenuItem(child: Text("Fraud"), value: "Fraud"),
    DropdownMenuItem(child: Text("Abusive"), value: "Abusive"),
  ];
  return menuItems;
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedValue = "Select";
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
