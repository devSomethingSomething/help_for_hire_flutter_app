import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

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
      child: Text(
        _data,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(
          256,
          64,
        ),
        primary: ColorConstants.blue,
      ),
    );
  }
}
