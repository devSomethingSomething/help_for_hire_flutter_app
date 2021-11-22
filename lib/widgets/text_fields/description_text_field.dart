// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DescriptionTextbox extends StatelessWidget {
  const DescriptionTextbox(
      {Key? key,
      required TextEditingController descriptionController,
      required String data,
      required TextInputType keyboardType,
      required int maxLines,
      required String? Function(String?)? validator})
      : _descriptionController = descriptionController,
        _data = data,
        _keyboardType = keyboardType,
        _maxLines = maxLines,
        _validator = validator,
        super(key: key);

  final TextEditingController _descriptionController;
  final String _data;
  final TextInputType _keyboardType;
  final int _maxLines;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) {
        return TextFormField(
          cursorColor: Colors.white,
          controller: _descriptionController,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            labelText: _data,
          ),
          keyboardType: _keyboardType,
          maxLines: _maxLines,
          style: TextStyle(
            color: Colors.white,
          ),
          validator: _validator,
        );
      },
    );
  }
}
