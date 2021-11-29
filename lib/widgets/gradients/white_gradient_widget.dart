import 'package:flutter/material.dart';

class WhiteGradientWidget extends StatelessWidget {
  const WhiteGradientWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.white,
              Colors.grey.shade200,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
