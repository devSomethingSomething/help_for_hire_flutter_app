import 'package:flutter/material.dart';

class DetailsTextWidget extends StatelessWidget {
  final String _data;

  const DetailsTextWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: const TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.center,
    );
  }
}
