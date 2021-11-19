import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double _height;
  final double _width;

  const DividerWidget({
    required double height,
    required double width,
  })  : _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _height,
        ),
        color: Colors.white,
      ),
      height: _height,
      width: _width,
    );
  }
}
