/// Imports
import 'package:flutter/material.dart';

/// Custom White gradient widget for the the whole app
/// except the registration pages
class WhiteGradientWidget extends StatelessWidget {
  /// Constructor
  const WhiteGradientWidget();

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.white,
              Colors.grey.shade200,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
