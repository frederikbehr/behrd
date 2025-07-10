import 'package:behrd/behrd.dart';
import 'package:behrd/src/components/native_checkbox/native_checkbox.dart';
import 'package:behrd/src/pages/settings/page/components/setting_card.dart';
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
      deviceType: targetPlatform,
      setting: setting,
      child: setting.style == OnOffSettingStyle.nativeSwitch? NativeSwitch(
        targetPlatform: targetPlatform,
        initialValue: setting.value,
        onChanged: (val) => setting.onChanged(val),
      ) : NativeCheckbox(
        targetPlatform: targetPlatform,
        initialValue: setting.value,
        size: 26,
        onChanged: (val) => setting.onChanged(val),
      ),
    );
  }
}
