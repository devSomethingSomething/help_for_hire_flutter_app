import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  final bool _invertColors;

  const RoundedButtonWidget({
    required String data,
    required void Function() onPressed,
    bool invertColors = false,
  })  : _data = data,
        _onPressed = onPressed,
        _invertColors = invertColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        child: Text(
          _data,
          style: const TextStyle(
            fontSize: 24.0,
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
