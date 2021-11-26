import 'package:flutter/material.dart';

class WhiteTextButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  const WhiteTextButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        child: Text(
          _data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: const EdgeInsets.all(
          16.0,
        ),
      ),
      onPressed: _onPressed,
    );
  }
}
