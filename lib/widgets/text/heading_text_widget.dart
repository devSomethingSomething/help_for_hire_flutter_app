import 'package:flutter/material.dart';

class HeadingTextWidget extends StatelessWidget {
  final String _data;

  const HeadingTextWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
