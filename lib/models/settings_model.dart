import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Light theme data
final lightTheme = ThemeData(
  brightness: Brightness.light,
);

/// Dark theme data
final darkTheme = ThemeData(
  brightness: Brightness.dark,
);

/// This model is responsible for storing settings data using shared
/// preferences
class SettingsModel with ChangeNotifier {
  /// Stores whether or not dark theme is enabled
  var _darkTheme = false;

  /// Shared preferences instance which is used inside this model
  SharedPreferences? _sharedPreferences;

  /// Constructor for the settings model class
  SettingsModel() {
    _loadSettingsFromSharedPreferences();
  }

  /// Getter for the dark theme
  bool get darkTheme => _darkTheme;

  /// Setter for the dark theme
  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;

    _saveSettingsToSharedPreferences();

    notifyListeners();
  }

  /// This method ensures that an instance of shared preferences is created
  /// before it is used within this model class
  Future<void> _initializeSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  /// This method loads settings data from shared preferences
  Future<void> _loadSettingsFromSharedPreferences() async {
    await _initializeSharedPreferences();

    _darkTheme = _sharedPreferences?.getBool('darkTheme') ?? false;

    notifyListeners();
  }

  /// This method saves settings data to shared preferences
  Future<void> _saveSettingsToSharedPreferences() async {
    await _initializeSharedPreferences();

    _sharedPreferences?.setBool(
      'darkTheme',
      _darkTheme,
    );
  }

  /// This method allows the dark theme to be turned on or off
  void toggleTheme() {
    _darkTheme = !_darkTheme;

    _saveSettingsToSharedPreferences();

    notifyListeners();
  }
}
