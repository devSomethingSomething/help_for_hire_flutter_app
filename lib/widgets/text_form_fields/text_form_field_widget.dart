import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController _controller;

  final String _labelText;

  final IconData _icon;

  final TextInputType _keyboardType;

  final int _maxLength;

  late final bool _showIcon;

  bool _obscureText;

  final String? Function(String?)? _validator;

  TextFormFieldWidget({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required TextInputType keyboardType,
    int maxLength = 32,
    bool obscureText = false,
    String? Function(String?)? validator,
  })  : _controller = controller,
        _labelText = labelText,
        _icon = icon,
        _keyboardType = keyboardType,
        _maxLength = maxLength,
        _obscureText = obscureText,
        _validator = validator {
    _showIcon = obscureText ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
        return TextFormField(
          cursorColor: Colors.white,
          controller: _controller,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorStyle: const TextStyle(
              color: Colors.white,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
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
          maxLength: _maxLength,
          obscureText: _obscureText,
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: _validator,
        );
      },
    );
  }
}
