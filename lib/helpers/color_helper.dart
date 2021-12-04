import 'dart:math';

import 'package:flutter/material.dart';

class ColorHelper {
  const ColorHelper._();

  static MaterialColor getRandomColor() => Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )];
}
