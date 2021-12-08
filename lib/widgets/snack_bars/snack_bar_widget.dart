/// Imports
import 'package:flutter/material.dart';

/// Custom snack bar widget for displayong error messages
class SnackBarWidget extends StatelessWidget {
  /// Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const SnackBarWidget({
    required String data,
  }) : _data = data;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        _data,
      ),
    );
  }
}
