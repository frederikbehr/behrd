import 'dart:io' show Platform;
import 'package:behrd/behrd.dart';
import 'package:behrd/src/utils/color_utils.dart';
import 'package:behrd/src/utils/target_platform_utils.dart';
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

  Color getMaterialBackgroundColor(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      return backgroundColor ?? Theme.of(context).colorScheme.primary;
    } else {
      return backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DeviceType platform = TargetPlatformUtils.determinePlatform(targetPlatform);
    if (platform == DeviceType.iOS) {
      return CupertinoNavigationBar(
        backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
        previousPageTitle: previousPageTitle,
        trailing: actions == null? null : Row(mainAxisSize: MainAxisSize.min, children: List.of(actions!)),
        leading: leading,
        border: bottomBorder == true || bottomBorder == null? Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)) : null,
        middle: titleReplacement ?? Text(
          title,
          style: TextStyle(
            color: ColorUtils.getTitleColorFromTheme(context),
          ),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: getMaterialBackgroundColor(context),
        centerTitle: false,
        elevation: 5.0,
        surfaceTintColor: Colors.transparent,
        actions: actions,
        iconTheme: IconThemeData(
          color: ColorUtils.getBodyColorFromBackgroundColor(getMaterialBackgroundColor(context), context),
        ),
        leading: leading,
        title: titleReplacement ?? Text(
          title,
          style: TextStyle(
            color: ColorUtils.getTitleColorFromBackgroundColor(getMaterialBackgroundColor(context), context),
          ),
        ),
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
