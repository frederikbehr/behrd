import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:behrd/src/pages/settings/setting/string/text_setting_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../behrd.dart';

class TextSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  @override
  final double? iconSize;

  @override
  final IconData? icon;

  @override
  final Color? iconColor;

  @override
  final bool shouldShowShortcutWidget = false;

  String value;

  final Function(bool) onChanged;

  TextSetting({
    required this.title,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
    this.icon,
    this.iconSize,
    this.iconColor
  });

  @override
  String? getPrimaryStringValue() => value;

  @override
  Widget getWidget(DeviceType targetPlatform) => TextSettingWidget(setting: this, targetPlatform: targetPlatform);

  @override
  Widget getShortcutWidget(DeviceType targetPlatform) {
    // TODO: implement getActionChild
    throw UnimplementedError();
  }

}