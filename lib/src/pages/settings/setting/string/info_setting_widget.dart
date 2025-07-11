import 'package:behrd/behrd.dart';
import 'package:behrd/src/pages/settings/setting/string/info_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/native_text_form_field/native_text_form_field.dart';

class InfoSettingWidget extends StatelessWidget {
  final InfoSetting setting;
  final DeviceType targetPlatform;
  const InfoSettingWidget({
    super.key,
    required this.setting,
    required this.targetPlatform,
  });

  @override
  Widget build(BuildContext context) {
    if (targetPlatform == DeviceType.iOS) {
      return CupertinoFormRow(
        prefix: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8.0),
          child: Text(setting.title),
        ),
        child: SizedBox(
          height: 36,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Text(setting.value),
            ),
          ),
        ),
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
