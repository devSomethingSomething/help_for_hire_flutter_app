import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController _controller;

  final String _labelText;

  final IconData? _icon;

  final TextInputType _keyboardType;

  final int _maxLength;

  late final bool _showIcon;

  bool _obscureText;

  final String? Function(String?)? _validator;

  final bool _lightMode;

  final int _maxLines;

  TextFormFieldWidget({
    required TextEditingController controller,
    required String labelText,
    IconData? icon,
    required TextInputType keyboardType,
    int maxLength = 32,
    bool obscureText = false,
    String? Function(String?)? validator,
    bool lightMode = false,
    int maxLines = 1,
  })  : _controller = controller,
        _labelText = labelText,
        _icon = icon,
        _keyboardType = keyboardType,
        _maxLength = maxLength,
        _obscureText = obscureText,
        _validator = validator,
        _lightMode = lightMode,
        _maxLines = maxLines {
    _showIcon = obscureText ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.always,
          cursorColor: _lightMode ? Colors.blue[900] : Colors.white,
          controller: _controller,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _lightMode ? Colors.blue.shade900 : Colors.white,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _lightMode ? Colors.blue.shade900 : Colors.white,
              ),
            ),
            errorStyle: TextStyle(
              color: _lightMode ? Colors.blue.shade900 : Colors.white,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _lightMode ? Colors.blue.shade900 : Colors.white,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _lightMode ? Colors.blue.shade900 : Colors.white,
              ),
            ),
            labelStyle: TextStyle(
              color: _lightMode ? Colors.blue.shade900 : Colors.white,
            ),
            labelText: _labelText,
            prefixIcon: Icon(
              _icon,
              color: _lightMode ? Colors.blue.shade900 : Colors.white,
            ),
            suffixIcon: _showIcon
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _lightMode ? Colors.blue.shade900 : Colors.white,
                    ),
                    onPressed: () => setState(
                      () => _obscureText = !_obscureText,
                    ),
                  )
                : null,
          ),
          keyboardType: _keyboardType,
          maxLength: _maxLength,
          maxLines: _maxLines,
          obscureText: _obscureText,
          style: TextStyle(
            color: _lightMode ? Colors.blue.shade900 : Colors.white,
          ),
          validator: _validator,
        );
      },
    );
  }
}
