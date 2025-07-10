import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static Future<T?> openWithRoute<T>(
      BuildContext context,
      Widget page,
      {
        required bool useCupertino,
      }) {
    final route = useCupertino
        ? CupertinoPageRoute<T>(builder: (_) => page)
        : MaterialPageRoute<T>(builder: (_) => page);

    return Navigator.push<T>(context, route);
  }
}