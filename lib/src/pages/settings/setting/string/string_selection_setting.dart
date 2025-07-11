import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:behrd/src/pages/settings/setting/string/string_selection_setting_style.dart';
import 'package:behrd/src/pages/settings/setting/string/string_selection_setting_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../behrd.dart';

class StringSelectionSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  @override
  final IconData? icon;

  @override
  final double? iconSize;

  @override
  final bool shouldShowShortcutWidget = false;

  @override
  final Color? iconColor;

  String value;
  final List<String> selections;

  final StringSelectionSettingCupertinoStyle cupertinoStyle;

  final Function(String) onChanged;

  StringSelectionSetting({
    required this.title,
    required this.selections,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.cupertinoStyle = StringSelectionSettingCupertinoStyle.check,
  });

  @override
  String? getPrimaryStringValue() => value;

  @override
  Widget getWidget(DeviceType targetPlatform) => StringSelectionSettingWidget(setting: this, targetPlatform: targetPlatform,);

  @override
  Widget getShortcutWidget(DeviceType targetPlatform) {
    // TODO: implement getActionChild
    throw UnimplementedError();
  }

}