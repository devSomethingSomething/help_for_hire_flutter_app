import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final String _labelText;

  final IconData _icon;

  final TextInputType _keyboardType;

  late final bool _showIcon;

  bool _obscureText;

  TextFormFieldWidget({
    required String labelText,
    required IconData icon,
    required TextInputType keyboardType,
    bool obscureText = false,
  })  : _labelText = labelText,
        _icon = icon,
        _keyboardType = keyboardType,
        _obscureText = obscureText {
    _showIcon = obscureText ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
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
            suffixIcon: _showIcon
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(
                      () => _obscureText = !_obscureText,
                    ),
                  )
                : null,
          ),
          keyboardType: _keyboardType,
          obscureText: _obscureText,
          style: const TextStyle(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
