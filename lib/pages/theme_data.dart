// ignore_for_file: prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(brightness: Brightness.light);
ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

class ThemeSettings with ChangeNotifier {
  bool _darkTheme = false;
  SharedPreferences? _preferences;

  bool get darkTheme => _darkTheme;

  ThemeSettings() {
    _loadSettingsFromPrefs();
  }

  _initializePrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _loadSettingsFromPrefs() async {
    await _initializePrefs();
    _darkTheme = _preferences?.getBool('darkTheme') ?? false;
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializePrefs();
    _preferences?.setBool('darkTheme', _darkTheme);
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
