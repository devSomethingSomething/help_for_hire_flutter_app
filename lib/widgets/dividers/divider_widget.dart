/// Imports
import 'package:flutter/material.dart';

/// Custom Divider widget
class DividerWidget extends StatelessWidget {
  /// Variables
  final double _height;
  final double _width;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const DividerWidget({
    required double height,
    required double width,
  })  : _height = height,
        _width = width;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _height,
        ),
        color: Colors.white,
      ),
      height: _height,
      width: _width,
    );
  }
}
