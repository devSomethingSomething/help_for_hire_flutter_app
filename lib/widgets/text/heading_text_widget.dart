///Imports
import 'package:flutter/material.dart';

/// Custom Text widget for headings
class HeadingTextWidget extends StatelessWidget {
  ///Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const HeadingTextWidget({
    required String data,
  }) : _data = data;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
