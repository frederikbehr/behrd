
import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:flutter/cupertino.dart';

class SettingsCategory {
  final String title;
  final List<Setting> settings;
  final IconData? icon;
  final bool showIcon;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final Color? categoryColor;

  const SettingsCategory({
    required this.title,
    required this.settings,
    this.showIcon = true,
    this.iconSize = 24,
    this.iconColor,
    this.textStyle,
    this.icon,
    this.categoryColor,
  });

  String? getPrimarySettingStringValue() {
    final int index = settings.indexWhere((e) => e.isPrimary);
    if (index == -1) return null;
    return settings[index].getPrimaryStringValue();
  }

  bool shouldUseShortcutWidget() => settings.length == 1 && settings.first.shouldShowShortcutWidget;
}