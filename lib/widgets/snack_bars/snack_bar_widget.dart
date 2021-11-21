import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  final String _data;

  const SnackBarWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        _data,
      ),
    );
  }
}
