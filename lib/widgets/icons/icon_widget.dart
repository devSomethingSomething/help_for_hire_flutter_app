/// Imports
import 'package:flutter/material.dart';

/// Custom Icon widget
class IconWidget extends StatelessWidget {
  /// Variables
  final IconData _icon;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const IconWidget({
    required IconData icon,
  }) : _icon = icon;

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Icon(
        _icon,
        color: Colors.grey,
        size: 128.0,
      ),
    );
  }
}
