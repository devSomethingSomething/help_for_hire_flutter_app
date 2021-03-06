/// Imports
import 'package:flutter/material.dart';

/// Custom flat button widget
class FlatButtonWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final void Function() _onPressed;
  final Color _primary;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const FlatButtonWidget({
    required String data,
    required void Function() onPressed,
    required Color primary,
  })  : _data = data,
        _onPressed = onPressed,
        _primary = primary;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        _data,
      ),
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: _primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
