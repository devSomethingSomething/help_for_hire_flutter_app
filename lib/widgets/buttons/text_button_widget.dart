/// Imports
import 'package:flutter/material.dart';

/// Custom Text button widget
class TextButtonWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final void Function() _onPressed;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const TextButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        _data,
      ),
      onPressed: _onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(
          256,
          48,
        ),
        primary: Colors.white,
      ),
    );
  }
}
