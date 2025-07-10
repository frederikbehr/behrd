import 'dart:io' show Platform;
import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BehrdNativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final String title;
  final Widget? titleReplacement;
  final bool? bottomBorder;
  final Color? textColor;
  final DeviceType targetPlatform;
  final String? previousPageTitle;
  const BehrdNativeAppBar({
    super.key,
    this.backgroundColor,
    this.actions,
    this.leading,
    this.titleReplacement,
    required this.title,
    this.bottomBorder,
    this.textColor,
    this.targetPlatform = DeviceType.auto,
    this.previousPageTitle,
  }) : preferredSize = const Size.fromHeight(56);

  @override
  final Size preferredSize;

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    late final DeviceType platform;
    if (targetPlatform == DeviceType.auto) {
      platform = Platform.isIOS? DeviceType.iOS : DeviceType.android;
    } else {
      platform = targetPlatform;
    }
    if (platform == DeviceType.iOS) {
      return CupertinoNavigationBar(
        backgroundColor: backgroundColor,
        previousPageTitle: previousPageTitle,
        trailing: actions == null? null : Row(mainAxisSize: MainAxisSize.min, children: List.of(actions!)),
        leading: leading,
        border: bottomBorder == true || bottomBorder == null? Border.all(color: Theme.of(context).dividerColor, width: 1) : null,
        middle: titleReplacement ?? Text(title),
      );
    } else {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0.0,
        actions: actions,
        leading: leading,
        title: titleReplacement ?? Text(title),
        bottom: bottomBorder == true? PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Theme.of(context).dividerColor,
            height: 1,
          ),
        ) : null,
      ); 
    }
  }
}
