import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String _data;

  bool _obscureText;
  bool _icon;
  TextEditingController _controllerData = TextEditingController();

  TextFieldWidget({
    required String data,
    required bool obscureText,
    required bool icon,
    required TextEditingController controllerData,
  })  : _data = data,
        _obscureText = obscureText,
        _icon = icon,
        _controllerData = controllerData;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50.0,
        left: 50.0,
      ),
      child: TextField(
        controller: widget._controllerData,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.teal,
          ),
          label: Text(
            widget._data,
          ),
          suffix: widget._icon
              ? IconButton(
                  icon: Icon(
                    widget._obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () => setState(
                    () => widget._obscureText = !widget._obscureText,
                  ),
                )
              : null,
        ),
        obscureText: widget._obscureText,
      ),
    );
  }
}
