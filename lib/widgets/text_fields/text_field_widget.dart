import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String _data;

  final TextInputType _keyboardType;

  const TextFieldWidget({
    required String data,
    required TextInputType keyboardType,
  })  : _data = data,
        _keyboardType = keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
      ),
      child: TextField(
        cursorColor: ColorConstants.blue,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            color: ColorConstants.blue,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.blue,
            ),
          ),
          label: Text(
            _data,
          ),
        ),
        keyboardType: _keyboardType,
      ),
    );
  }
}
