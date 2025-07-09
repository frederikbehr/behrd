import 'package:behrd/src/pages/settings/category/settings_category.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final DeviceType deviceType;
  final SettingsCategory category;
  final Function(SettingsCategory) onPressed;

  const CategoryCard({
    super.key,
    required this.deviceType,
    required this.category,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                category.icon != null? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category.categoryColor ?? Theme.of(context).colorScheme.secondary,
                    ),
                    child: Icon(
                      category.icon,
                      size: category.iconSize,
                      color: category.iconColor  ?? Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ) : const SizedBox(),
                Text(
                  category.title,
                  style: category.textStyle ?? TextStyle(
                    fontSize: 18,
                  ),
                )

              ],
            ),

            Row(
              children: [
                Icon(
                  deviceType == DeviceType.android
                      ? Icons.arrow_forward
                      : Icons.arrow_forward_ios,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    switch (deviceType) {
      case DeviceType.iOS: return GestureDetector(
        onTap: () => onPressed(category),
        behavior: HitTestBehavior.opaque,
        child: buttonContent,
      );
      case DeviceType.android: return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onPressed(category),
          child: buttonContent,
        ),
      );
      case DeviceType.auto: {
        throw Exception("Auto mode should be defaulted to a platform at this stage. Please use either android or iOS as deviceType.");
      }
    }
  }
}
