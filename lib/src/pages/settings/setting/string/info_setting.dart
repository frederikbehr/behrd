import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:behrd/src/pages/settings/setting/string/info_setting_widget.dart';
import 'package:behrd/src/pages/settings/setting/string/text_setting_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../behrd.dart';

class InfoSetting implements Setting {

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

  InfoSetting({
    required this.title,
    this.isPrimary = false,
    required this.value,
    this.icon,
    this.iconSize,
    this.iconColor
  });

  @override
  String? getPrimaryStringValue() => value;

  @override
  Widget getWidget(DeviceType targetPlatform) => InfoSettingWidget(setting: this, targetPlatform: targetPlatform);

  @override
  Widget getShortcutWidget(DeviceType targetPlatform) => Text(value);

}