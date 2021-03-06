/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/form_model.dart';
import 'package:provider/provider.dart';

/// Custom Text field for the password field
class PasswordTextFieldWidget extends StatelessWidget {
  /// Variables
  final String _data;
  final TextInputType _keyboardType;
  final TextEditingController _controller;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const PasswordTextFieldWidget({
    required String data,
    required TextInputType keyboardType,
    required TextEditingController controller,
  })  : _data = data,
        _keyboardType = keyboardType,
        _controller = controller;

  /// Builds the widget
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
            controller: _controller,
            cursorColor: ColorConstants.darkBlue,
            decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                color: ColorConstants.darkBlue,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstants.darkBlue,
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
