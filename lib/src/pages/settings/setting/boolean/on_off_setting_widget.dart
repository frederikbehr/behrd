import 'package:behrd/behrd.dart';
import 'package:behrd/src/components/native_switch/native_switch.dart';
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
      child: NativeSwitch(
        targetPlatform: targetPlatform,
        value: false,
        onChanged: (val) => setting.onChanged(val),
      ),
    );
  }
}
