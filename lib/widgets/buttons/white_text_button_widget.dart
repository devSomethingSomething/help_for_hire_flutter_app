/// Imports
import 'package:flutter/material.dart';

/// Custom white text button widget
class WhiteTextButtonWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final void Function() _onPressed;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const WhiteTextButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        child: Text(
          _data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: const EdgeInsets.all(
          16.0,
        ),
      ),
      onPressed: _onPressed,
    );
  }
}
