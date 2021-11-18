import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String _labelText;

  final IconData _icon;

  final TextInputType _keyboardType;

  const TextFormFieldWidget({
    required String labelText,
    required IconData icon,
    required TextInputType keyboardType,
  })  : _labelText = labelText,
        _icon = icon,
        _keyboardType = keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        labelText: _labelText,
        prefixIcon: Icon(
          _icon,
          color: Colors.white,
        ),
      ),
      keyboardType: _keyboardType,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
