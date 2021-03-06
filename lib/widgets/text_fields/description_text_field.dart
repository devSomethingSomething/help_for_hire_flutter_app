// ignore_for_file: prefer_const_constructors
/// Imports
import 'package:flutter/material.dart';

/// Custom Text box for the description text field
class DescriptionTextbox extends StatelessWidget {
  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const DescriptionTextbox({
    Key? key,
    required TextEditingController descriptionController,
    required String data,
    required TextInputType keyboardType,
    required int maxLines,
    required String? Function(String?)? validator,
    required Color color,
  })  : _descriptionController = descriptionController,
        _data = data,
        _keyboardType = keyboardType,
        _maxLines = maxLines,
        _validator = validator,
        _color = color,
        super(key: key);

  /// Variables
  final TextEditingController _descriptionController;
  final String _data;
  final TextInputType _keyboardType;
  final int _maxLines;
  final String? Function(String?)? _validator;
  final Color _color;

  /// Builds the Widget
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
        return TextFormField(
          cursorColor: _color,
          controller: _descriptionController,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _color,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _color,
              ),
            ),
            errorStyle: TextStyle(color: _color),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _color,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _color,
              ),
            ),
            labelStyle: TextStyle(
              color: _color,
            ),
            labelText: _data,
          ),
          keyboardType: _keyboardType,
          maxLines: _maxLines,
          style: TextStyle(
            color: _color,
          ),
          validator: _validator,
        );
      },
    );
  }
}
