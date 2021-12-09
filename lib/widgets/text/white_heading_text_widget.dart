/// Imports
import 'package:flutter/material.dart';

/// Custom Text widget for the heading but in a white color
class WhiteHeadingTextWidget extends StatelessWidget {
  /// Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const WhiteHeadingTextWidget({
    required String data,
  }) : _data = data;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
