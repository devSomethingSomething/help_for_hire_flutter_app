/// Imports
import 'package:flutter/material.dart';

/// Holds various color constants used within the app
class ColorConstants {
  /// Constructor
  const ColorConstants._();

  /// Colors used within the app, try to use these if possible to maintain a
  /// consistent color scheme
  /// Getter for orange
  static Color get orange => Colors.orange;

  /// Getter for black
  static Color get black => Colors.black;

  /// Getter for white
  static Color get white => Colors.white;

  /// Getter for grey
  static Color get grey => Colors.grey;

  /// Getter for light blue
  static Color get lightBlue => Colors.blue.shade200;

  /// Getter for blue
  static Color get blue => Colors.blue;

  /// Getter for dark blue
  ///
  /// The standard blue used in the app
  static Color get darkBlue => Colors.blue.shade900;
}
