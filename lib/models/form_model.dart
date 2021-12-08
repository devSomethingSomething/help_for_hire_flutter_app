import 'package:flutter/material.dart';

class FormModel with ChangeNotifier {
  /// From Model variables
  static bool _obscureText = true;

  /// Empty From Model constructor
  FormModel();

  /// Getter for the obscure text
  bool get obscureText => _obscureText;

  /// Setter for the obscure text
  set obscureText(bool obscureText) {
    _obscureText = obscureText;

    notifyListeners();
  }
}
