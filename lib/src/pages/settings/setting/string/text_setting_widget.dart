import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/native_text_form_field/native_text_form_field.dart';

class TextSettingWidget extends StatelessWidget {
  final TextSetting setting;
  final DeviceType targetPlatform;
  const TextSettingWidget({
    super.key,
    required this.setting,
    required this.targetPlatform,
  });

  @override
  Widget build(BuildContext context) {
    if (targetPlatform == DeviceType.iOS) {
      return BehrdNativeTextField(
        onChanged: (String val) {},
        autoFocus: false,
        onSubmitted: () {},
        initialValue: setting.value,
        textInputType: TextInputType.text,
        title: setting.title,
        targetPlatform: DeviceType.iOS,
      );
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 8, start: 16, end: 16),
        child: BehrdNativeTextField(
          onChanged: (String val) {},
          autoFocus: false,
          onSubmitted: () {},
          initialValue: setting.value,
          textInputType: TextInputType.text,
          title: setting.title,
          targetPlatform: targetPlatform,
          icon: setting.icon,
        ),
      );
    }
  }
}
