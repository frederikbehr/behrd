import 'package:behrd/behrd.dart';
import 'package:behrd/src/utils/target_platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BehrdNativeTextButton extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Color? backgroundColor;
  final DeviceType targetPlatform;
  final Function() onPressed;
  final EdgeInsets? padding;
  const BehrdNativeTextButton({
    super.key,
    required this.title,
    this.style,
    this.backgroundColor,
    this.targetPlatform = DeviceType.auto,
    required this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType platform = TargetPlatformUtils.determinePlatform(targetPlatform);
    if (platform == DeviceType.iOS) {
      return CupertinoButton(
        onPressed: () => onPressed(),
        padding: padding,
        color: backgroundColor,
        child: Text(title, style: style),
      );
    } else if (platform == DeviceType.android) {
      return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor ?? Theme.of(context).colorScheme.primaryContainer),
        ),
        onPressed: onPressed,
        child: Text(title, style: style),
      );
    } else {
      throw UnimplementedError();
    }
  }
}
