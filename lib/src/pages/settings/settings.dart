import 'dart:io';
import 'package:behrd/src/pages/settings/category/settings_category.dart';
import 'package:behrd/src/pages/settings/group/settings_category_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:behrd/src/pages/pages.dart';
import 'package:behrd/src/pages/settings/page/settings_scaffold.dart';

class BehrdSettings implements Pages {
  @override
  final DeviceType targetPlatform;
  final List<SettingsCategoryGroup> categories;
  final String title;

  const BehrdSettings({
    this.targetPlatform = DeviceType.iOS,
    this.title = "Settings",
    required this.categories,
  });

  @override
  Future<T?> open<T>(BuildContext context) {
    final bool useCupertino = switch (targetPlatform) {
      DeviceType.iOS => true,
      DeviceType.android => false,
      DeviceType.auto => Platform.isIOS,
    };

    return _openWithRoute<T>(
      context,
      SettingsPage(
        title: title,
        targetPlatform: useCupertino? DeviceType.iOS : DeviceType.android,
        groups: categories,
      ),
      useCupertino: useCupertino,
    );
  }

  Future<T?> _openWithRoute<T>(
      BuildContext context,
      Widget page,
      {
        required bool useCupertino,
      }) {
    final route = useCupertino
        ? CupertinoPageRoute<T>(builder: (_) => page)
        : MaterialPageRoute<T>(builder: (_) => page);

    return Navigator.push<T>(context, route);
  }
}
