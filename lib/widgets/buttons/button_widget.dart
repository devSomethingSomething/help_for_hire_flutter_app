/// Imports
import 'package:flutter/material.dart';

/// Custom button widget
class ButtonWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final void Function() _onPressed;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const ButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Text(
          _data,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8.0,
        onPrimary: Colors.blue[900],
        primary: Colors.white,
      ),
    );
  }
}
