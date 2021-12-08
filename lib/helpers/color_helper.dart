/// Imports
import 'dart:math';

import 'package:flutter/material.dart';

/// Holds helpers related to colors
class ColorHelper {
  /// Constructor
  const ColorHelper._();

  /// Generates a random color and returns it
  ///
  /// Used mainly for testing
  static MaterialColor getRandomColor() => Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )];
}
