import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticLoading extends StatelessWidget {
  final DeviceType targetPlatform;
  final double size;
  const StaticLoading({
    super.key,
    required this.targetPlatform,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (targetPlatform == DeviceType.iOS) {
      return CupertinoActivityIndicator(radius: size / 2);
    } else {
      return SizedBox(width: size, child: CircularProgressIndicator(strokeWidth: size / 10));
    }
  }
}
