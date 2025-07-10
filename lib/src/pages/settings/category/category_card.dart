import 'package:behrd/src/pages/settings/category/settings_category.dart';
import 'package:behrd/src/utils/device_type.dart';
import 'package:behrd/src/utils/string_utils.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final DeviceType targetPlatform;
  final SettingsCategory category;
  final Function(SettingsCategory) onPressed;

  const CategoryCard({
    super.key,
    required this.targetPlatform,
    required this.category,
    required this.onPressed,
  });

  void open() {
    if (!category.shouldUseShortcutWidget()) {
      onPressed(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget buttonContent = SizedBox(
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
                      color: category.categoryColor ?? Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Icon(
                      category.icon,
                      size: category.iconSize,
                      color: category.iconColor  ?? Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ) : const SizedBox(),
                Text(
                  category.title,
                  style: category.textStyle ?? TextStyle(
                    fontSize: 16,
                  ),
                )

              ],
            ),

            !category.shouldUseShortcutWidget()? Row(
              children: [
                Text(
                  StringUtils.firstLetterUpper(category.getPrimarySettingStringValue() ?? ""),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(101),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  targetPlatform == DeviceType.android
                      ? Icons.arrow_forward
                      : Icons.arrow_forward_ios,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ) : category.settings.first.getShortcutWidget(targetPlatform),
          ],
        ),
      ),
    );
    switch (targetPlatform) {
      case DeviceType.iOS: return GestureDetector(
        onTap: () => open(),
        behavior: HitTestBehavior.opaque,
        child: buttonContent,
      );
      case DeviceType.android: return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => open(),
          child: buttonContent,
        ),
      );
      case DeviceType.auto: {
        throw Exception("Auto mode should be defaulted to a platform at this stage. Please use either android or iOS as deviceType.");
      }
    }
  }
}
