// ignore_for_file: prefer_const_constructors
/// Imports
import 'package:flutter/material.dart';

/// Custom Text field widget
class TextFieldWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final TextInputType _keyboardType;
  final TextEditingController _controller;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const TextFieldWidget({
    required String data,
    required TextInputType keyboardType,
    required TextEditingController controller,
  })  : _data = data,
        _keyboardType = keyboardType,
        _controller = controller;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
      ),
      child: TextField(
        controller: _controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            color: Colors.white,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          label: Text(
            _data,
          ),
        ),
        keyboardType: _keyboardType,
      ),
    );
  }
}
