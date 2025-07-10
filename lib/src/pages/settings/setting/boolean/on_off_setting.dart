import 'package:behrd/behrd.dart';
import 'package:behrd/src/pages/settings/setting/boolean/on_off_setting_widget.dart';
import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:flutter/cupertino.dart';

class OnOffSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  @override
  final IconData? icon;

  @override
  final double? iconSize;

  @override
  final bool shouldShowShortcutWidget = true;

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

  @override
  Widget getShortcutWidget(DeviceType targetPlatform) {
    switch(style) {
      case OnOffSettingStyle.nativeSwitch: return NativeSwitch(
        targetPlatform: targetPlatform,
        initialValue: value,
        onChanged: (val) => onChanged(val),
      );
      case OnOffSettingStyle.checkBox: return NativeCheckbox(
        targetPlatform: targetPlatform,
        initialValue: value,
        onChanged: (val) => onChanged(val),
        size: 26,
      );
    }
  }

}