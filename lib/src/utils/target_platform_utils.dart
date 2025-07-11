import 'package:behrd/behrd.dart';
import 'dart:io' show Platform;

class TargetPlatformUtils {
  static DeviceType determinePlatform(DeviceType targetPlatform) {
    if (targetPlatform == DeviceType.auto) {
      return Platform.isIOS? DeviceType.iOS : DeviceType.android;
    }
    return targetPlatform;
  }
}