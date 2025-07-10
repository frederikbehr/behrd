import 'package:behrd/src/pages/settings/setting/setting.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final DeviceType deviceType;
  final Setting setting;
  final Widget child;

  const SettingCard({
    super.key,
    required this.deviceType,
    required this.setting,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  setting.title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )

              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
