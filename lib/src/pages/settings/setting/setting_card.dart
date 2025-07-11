import 'package:behrd/src/ios_components/cupertino_prefix_widget.dart';
import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final DeviceType targetPlatform;
  final Setting setting;
  final Widget child;

  const SettingCard({
    super.key,
    required this.targetPlatform,
    required this.setting,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      setting.title,
      style: TextStyle(
        fontSize: 16,
      ),
    );
    if (targetPlatform == DeviceType.iOS) {
      return CupertinoFormRow(
        prefix: setting.icon != null? CupertinoPrefixWidget(
          icon: setting.icon!,
          title: setting.title,
          color: setting.iconColor ?? Theme.of(context).colorScheme.primary,
        ) : title,
        child: SizedBox(
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              child,
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  setting.icon != null? Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Icon(
                        setting.icon,
                        size: setting.iconSize,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ) : const SizedBox(),
                  title,
                ],
              ),
              child,
            ],
          ),
        ),
      );
    }
  }
}
