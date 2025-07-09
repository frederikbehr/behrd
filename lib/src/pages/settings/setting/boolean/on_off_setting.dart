import 'package:behrd/src/pages/settings/setting/setting.dart';

import 'on_off_setting_style.dart';

class OnOffSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

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
  });

  @override
  String? getPrimaryStringValue() => value? onHint : offHint;

}