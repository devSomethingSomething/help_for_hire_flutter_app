import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  final bool _invertColors;

  final bool _reduceSize;

  const RoundedButtonWidget({
    required String data,
    required void Function() onPressed,
    bool invertColors = false,
    bool reduceSize = false,
  })  : _data = data,
        _onPressed = onPressed,
        _invertColors = invertColors,
        _reduceSize = reduceSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _reduceSize ? 16.0 : 32.0,
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
