import 'package:flutter/material.dart';

class BlueGradientWidget extends StatelessWidget {
  const BlueGradientWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade600,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
