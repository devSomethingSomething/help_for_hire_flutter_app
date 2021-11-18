import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String _data;

  const HeaderWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32.0,
          ),
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
        ),
        Text(
          _data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // For if we ever need an icon on the right side as well
        const IconButton(
          icon: Icon(
            null,
            size: 32.0,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
