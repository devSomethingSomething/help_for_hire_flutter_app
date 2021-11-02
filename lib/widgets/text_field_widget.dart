import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String _data;

  bool _obscureText;

  TextFieldWidget({
    required String data,
    required bool obscureText,
  })  : _data = data,
        _obscureText = obscureText;

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
          suffixIcon: IconButton(
            icon: Icon(
              widget._obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => setState(
              () => widget._obscureText = !widget._obscureText,
            ),
          ),
        ),
        obscureText: widget._obscureText,
      ),
    );
  }
}
