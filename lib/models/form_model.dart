import 'package:flutter/material.dart';

class FormModel with ChangeNotifier {
  static bool _obscureText = true;

  FormModel();

  bool get obscureText => _obscureText;

  set obscureText(bool obscureText) {
    _obscureText = obscureText;

    notifyListeners();
  }
}
