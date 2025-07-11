import 'package:behrd/behrd.dart';
import 'package:behrd/src/utils/target_platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BehrdNativeStaticLoading extends StatelessWidget {
  final DeviceType targetPlatform;
  final double size;
  const BehrdNativeStaticLoading({
    super.key,
    required this.targetPlatform,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (TargetPlatformUtils.determinePlatform(targetPlatform) == DeviceType.iOS) {
      return CupertinoActivityIndicator(radius: size / 2);
    } else {
      return SizedBox(width: size, height: size, child: CircularProgressIndicator());
    }
  }
}
