// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DescriptionTextbox extends StatelessWidget {
  const DescriptionTextbox({
    Key? key,
    required TextEditingController descriptionController,
    required String data,
  })  : _descriptionController = descriptionController,
        _data = data,
        super(key: key);

  final TextEditingController _descriptionController;
  final String _data;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      textCapitalization: TextCapitalization.sentences,
      maxLines: 3,
      controller: _descriptionController,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        labelText: _data,
      ),
    );
  }
}
