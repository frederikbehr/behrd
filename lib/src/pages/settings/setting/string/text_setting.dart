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

  String value;

  final Function(bool) onChanged;

  TextSetting({
    required this.title,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
    this.icon,
    this.iconSize,
  });

  @override
  String? getPrimaryStringValue() => value;

  @override
  Widget getWidget(DeviceType targetPlatform) => TextSettingWidget(setting: this);

}