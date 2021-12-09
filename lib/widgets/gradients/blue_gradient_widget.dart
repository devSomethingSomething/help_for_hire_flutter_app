/// Imports
import 'package:flutter/material.dart';

/// Custom Blue gradient widget for the registrations background
class BlueGradientWidget extends StatelessWidget {
  /// Constructor
  const BlueGradientWidget();

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade600,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
