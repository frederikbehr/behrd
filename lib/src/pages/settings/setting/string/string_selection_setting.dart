import 'package:behrd/src/pages/settings/setting/setting.dart';
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

  String value;
  final List<String> selections;

  final Function(bool) onChanged;

  StringSelectionSetting({
    required this.title,
    required this.selections,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
    this.icon,
    this.iconSize,
  });

  @override
  String? getPrimaryStringValue() => value;

  @override
  Widget getWidget(DeviceType targetPlatform) => StringSelectionSettingWidget(setting: this);

  @override
  Widget getShortcutWidget(DeviceType targetPlatform) {
    // TODO: implement getActionChild
    throw UnimplementedError();
  }

}