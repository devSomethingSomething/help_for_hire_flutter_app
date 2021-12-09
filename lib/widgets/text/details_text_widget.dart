/// Imports
import 'package:flutter/material.dart';

/// Custom Text widget for details
class DetailsTextWidget extends StatelessWidget {
  /// Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const DetailsTextWidget({
    required String data,
  }) : _data = data;

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
