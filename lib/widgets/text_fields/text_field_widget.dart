import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String _data;

  final TextInputType _keyboardType;

  final TextEditingController _controller;

  const TextFieldWidget({
    required String data,
    required TextInputType keyboardType,
    required TextEditingController controller,
  })  : _data = data,
        _keyboardType = keyboardType,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
      ),
      child: TextField(
        controller: _controller,
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
