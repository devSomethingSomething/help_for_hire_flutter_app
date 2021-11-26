import 'package:flutter/material.dart';

class WhiteHeadingTextWidget extends StatelessWidget {
  final String _data;

  const WhiteHeadingTextWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
