/// Imports
import 'package:flutter/material.dart';

/// Holds data used by forms throughout the app
/// Most likely not need anymore
class FormModel with ChangeNotifier {
  /// Form Model variables
  static bool _obscureText = true;

  /// Empty Form Model constructor
  FormModel();

  /// Getter for the obscure text
  bool get obscureText => _obscureText;

  /// Setter for the obscure text
  set obscureText(bool obscureText) {
    _obscureText = obscureText;

    notifyListeners();
  }
}
