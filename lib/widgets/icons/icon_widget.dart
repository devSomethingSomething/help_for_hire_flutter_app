import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData _icon;

  const IconWidget({
    required IconData icon,
  }) : _icon = icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Icon(
        _icon,
        color: Colors.grey,
        size: 128.0,
      ),
    );
  }
}
