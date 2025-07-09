import 'package:flutter/cupertino.dart';

import '../utils/device_type.dart';

abstract class Pages {
  DeviceType get targetPlatform;

  Future<T?> open<T>(BuildContext context);
}