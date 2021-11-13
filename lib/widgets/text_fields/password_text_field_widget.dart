import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/form_model.dart';
import 'package:provider/provider.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final String _data;

  final TextInputType _keyboardType;

  const PasswordTextFieldWidget({
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
      child: Selector<FormModel, bool>(
        selector: (_, formModel) => formModel.obscureText,
        builder: (_, obscureText, __) {
          return TextField(
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
              suffix: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () =>
                    context.read<FormModel>().obscureText = !obscureText,
              ),
            ),
            keyboardType: _keyboardType,
            obscureText: obscureText,
          );
        },
      ),
    );
  }
}
