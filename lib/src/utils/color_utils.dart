import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  static Brightness determineBrightnessFromColor(Color color) => ThemeData.estimateBrightnessForColor(color);

  static Color getTextColorFromBackgroundColor(Color backgroundColor) {
    final Brightness brightness = determineBrightnessFromColor(backgroundColor);
    if (brightness == Brightness.light) {
      return Colors.black87;
    } else {
      return Colors.white;
    }
  }
}