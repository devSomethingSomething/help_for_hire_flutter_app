import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  const ButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
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
        onPrimary: Colors.blue[900],
        primary: Colors.white,
      ),
    );
  }
}
