import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  static Brightness determineBrightnessFromColor(Color color) => ThemeData.estimateBrightnessForColor(color);

  static Color getTitleColorFromBackgroundColor(Color? backgroundColor, BuildContext context) {
    if (backgroundColor == null) return getTitleColorFromTheme(context);
    final Brightness brightness = determineBrightnessFromColor(backgroundColor);
    if (brightness == Brightness.light) {
      return Colors.black87;
    } else {
      return Colors.white;
    }
  }

  static Color getTitleColorFromTheme(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      return Colors.black87;
    } else {
      return Colors.white;
    }
  }

  static Color getBodyColorFromBackgroundColor(Color? backgroundColor, BuildContext context) {
    if (backgroundColor == null) return getBodyColorFromTheme(context);
    final Brightness brightness = determineBrightnessFromColor(backgroundColor);
    if (brightness == Brightness.light) {
      return Colors.black54;
    } else {
      return Colors.white70;
    }
  }

  static Color getBodyColorFromTheme(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      return Colors.black54;
    } else {
      return Colors.white70;
    }
  }
}