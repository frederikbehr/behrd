import 'package:behrd/behrd.dart';
import 'package:behrd/src/components/native_checkbox/native_checkbox.dart';
import 'package:behrd/src/pages/settings/setting/setting_card.dart';
import 'package:flutter/material.dart';

class OnOffSettingWidget extends StatelessWidget {
  final OnOffSetting setting;
  final DeviceType targetPlatform;
  const OnOffSettingWidget({
    super.key,
    required this.setting,
    required this.targetPlatform,
  });

  @override
  Widget build(BuildContext context) {
    return SettingCard(
      targetPlatform: targetPlatform,
      setting: setting,
      child: setting.style == OnOffSettingStyle.nativeSwitch? BehrdNativeSwitch(
        targetPlatform: targetPlatform,
        initialValue: setting.value,
        onChanged: (val) => setting.onChanged(val),
      ) : BehrdNativeCheckbox(
        targetPlatform: targetPlatform,
        initialValue: setting.value,
        size: 26,
        onChanged: (val) => setting.onChanged(val),
      ),
    );
  }
}
