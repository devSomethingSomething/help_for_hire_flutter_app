/// Imports
import 'package:flutter/material.dart';

/// Custom Rounded button widget
class RoundedButtonWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final void Function() _onPressed;
  final bool _invertColors;
  final bool _reduceSize;
  final double _horizontal;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const RoundedButtonWidget({
    required String data,
    required void Function() onPressed,
    bool invertColors = false,
    bool reduceSize = false,
    double horizontal = 32.0,
  })  : _data = data,
        _onPressed = onPressed,
        _invertColors = invertColors,
        _reduceSize = reduceSize,
        _horizontal = horizontal;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _reduceSize ? _horizontal / 2.0 : _horizontal,
          vertical: _reduceSize ? 8.0 : 16.0,
        ),
        child: Text(
          _data,
          style: TextStyle(
            fontSize: _reduceSize ? 20.0 : 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8.0,
        onPrimary: _invertColors ? Colors.white : Colors.blue[900],
        primary: _invertColors ? Colors.blue[900] : Colors.white,
        shape: const StadiumBorder(),
      ),
    );
  }
}
