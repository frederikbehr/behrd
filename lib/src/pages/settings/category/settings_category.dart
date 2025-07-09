
import 'package:behrd/src/pages/settings/category/setting.dart';
import 'package:flutter/cupertino.dart';

class SettingsCategory {
  final String title;
  final List<Setting> items;
  final IconData? icon;
  final bool showIcon;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final Color? categoryColor;

  const SettingsCategory({
    required this.title,
    required this.items,
    this.showIcon = true,
    this.iconSize = 24,
    this.iconColor,
    this.textStyle,
    this.icon,
    this.categoryColor,
  });

}