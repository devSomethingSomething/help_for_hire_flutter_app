import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  const TextButtonWidget({
    required String data,
    required void Function() onPressed,
  })  : _data = data,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        _data,
      ),
      onPressed: _onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(
          256,
          48,
        ),
        primary: Colors.black,
      ),
    );
  }
}
