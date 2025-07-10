import 'package:flutter/cupertino.dart';

import '../../../../behrd.dart';

abstract class Setting {
  String get title;
  bool get isPrimary;
  IconData? get icon;
  double? get iconSize;
  String? getPrimaryStringValue();
  Widget getWidget(DeviceType targetPlatform);
  Widget getShortcutWidget(DeviceType targetPlatform);
  bool get shouldShowShortcutWidget;
}