import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String _data;

  const ElevatedButtonWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 50.0,
      child: ElevatedButton(
        child: Text(
          _data,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.teal,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
