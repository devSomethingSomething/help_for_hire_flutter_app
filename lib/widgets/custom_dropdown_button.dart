// ignore_for_file: prefer_typing_uninitialized_variables
/// Imports
import 'package:flutter/material.dart';

/// Custom Drop down button
class CustomDropdownButton extends StatefulWidget {
  /// Variables
  final initialVal;
  final allVal;

  /// Constructor with required fields
  const CustomDropdownButton({
    Key? key,
    required this.initialVal,
    required this.allVal,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    var currentVal = widget.initialVal;
    return DropdownButton<dynamic>(
      value: currentVal,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      // ignore: unnecessary_question_mark
      onChanged: (dynamic? newValue) {
        setState(() {
          currentVal = newValue!;
        });
      },
      items: widget.allVal.map<DropdownMenuItem<dynamic>>((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
    );
  }
}
