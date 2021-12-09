/// Imports
import 'package:flutter/material.dart';

/// Custom Text form field widget for text fields
/// where data needs to be captured
// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  /// Variables
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

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
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

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
        return TextFormField(
          /// Real time validation
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

                    /// Makes the password text visible or non visible
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
