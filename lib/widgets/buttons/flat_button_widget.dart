import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final String _data;

  final void Function() _onPressed;

  final Color _primary;

  const FlatButtonWidget({
    required String data,
    required void Function() onPressed,
    required Color primary,
  })  : _data = data,
        _onPressed = onPressed,
        _primary = primary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        _data,
      ),
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: _primary,
        shape: const StadiumBorder(),
      ),
    );
  }
}
