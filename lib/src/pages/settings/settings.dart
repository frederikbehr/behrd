import 'dart:io';
import 'package:behrd/src/pages/settings/category/settings_category.dart';
import 'package:behrd/src/pages/settings/group/settings_category_group.dart';
import 'package:behrd/src/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:behrd/src/pages/pages.dart';
import 'package:behrd/src/pages/settings/page/settings_scaffold.dart';

class BehrdSettings implements Pages {
  @override
  final DeviceType targetPlatform;
  final List<SettingsCategoryGroup> groups;
  final String title;

  const BehrdSettings({
    this.targetPlatform = DeviceType.iOS,
    this.title = "Settings",
    required this.groups,
  });

  @override
  Future<T?> open<T>(BuildContext context) {
    final bool useCupertino = switch (targetPlatform) {
      DeviceType.iOS => true,
      DeviceType.android => false,
      DeviceType.auto => Platform.isIOS,
    };

    return NavigatorUtils.openWithRoute<T>(
      context,
      SettingsPage(
        title: title,
        targetPlatform: useCupertino? DeviceType.iOS : DeviceType.android,
        groups: groups,
      ),
      useCupertino: useCupertino,
    );
  }
}
