import 'package:behrd/behrd.dart';
import 'package:behrd/src/pages/settings/setting/boolean/on_off_setting_widget.dart';
import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:flutter/cupertino.dart';

import 'on_off_setting_style.dart';

class OnOffSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  @override
  final IconData? icon;

  @override
  final double? iconSize;

  bool value;

  final OnOffSettingStyle style;
  final Function(bool) onChanged;
  final String onHint;
  final String offHint;

  OnOffSetting({
    required this.title,
    this.isPrimary = false,
    this.style = OnOffSettingStyle.nativeSwitch,
    required this.onChanged,
    this.value = true,
    this.onHint = "On",
    this.offHint = "Off",
    this.icon,
    this.iconSize,
  });

  @override
  String? getPrimaryStringValue() => value? onHint : offHint;

  @override
  Widget getWidget(DeviceType targetPlatform) => OnOffSettingWidget(setting: this, targetPlatform: targetPlatform);

}