import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData _icon;

  const IconWidget({
    required IconData icon,
  }) : _icon = icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 50.0,
      ),
      child: Icon(
        _icon,
        color: Colors.grey,
        size: 150.0,
      ),
    );
  }
}
