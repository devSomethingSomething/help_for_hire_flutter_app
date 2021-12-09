/// Imports
import 'package:flutter/material.dart';

/// Custom Header widget for all the pages except the registration pages
class HeaderWidget extends StatelessWidget {
  /// Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const HeaderWidget({
    required String data,
  }) : _data = data;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
        ),
        Text(
          _data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // For if we ever need an icon on the right side as well
        const IconButton(
          icon: Icon(
            null,
            size: 24.0,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
