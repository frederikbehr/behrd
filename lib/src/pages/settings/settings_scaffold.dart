import 'package:behrd/src/components/native_app_bar/native_app_bar.dart';
import 'package:behrd/src/pages/settings/group/settings_category_group.dart';
import 'package:behrd/src/pages/settings/category/category_card/category_card.dart';
import 'package:behrd/src/pages/settings/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/device_type.dart';
import '../../utils/navigator_utils.dart';
import 'category/settings_category.dart';

class SettingsPage extends StatefulWidget {
  final DeviceType targetPlatform;
  final List<SettingsCategoryGroup> groups;
  final String title;
  final String? previousPageTitle;

  const SettingsPage({
    super.key,
    required this.targetPlatform,
    required this.groups,
    required this.title,
    this.previousPageTitle,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  Future openSetting(SettingsCategory category) {
    final bool usingCupertino = widget.targetPlatform == DeviceType.iOS;
    return NavigatorUtils.openWithRoute(
      context,
      SettingPage(category: category, targetPlatform: widget.targetPlatform, previousPageTitle: widget.title),
      useCupertino: usingCupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BehrdNativeAppBar(
        title: widget.title,
        previousPageTitle: widget.previousPageTitle,
        targetPlatform: widget.targetPlatform,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 72),
              itemCount: widget.groups.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.targetPlatform == DeviceType.iOS) {
                  return CupertinoFormSection(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    header: widget.groups[index].title != null? Text(widget.groups[index].title!) : null,
                    children: widget.groups[index].categories.map((category) {
                      return CategoryCard(
                        targetPlatform: widget.targetPlatform,
                        category: category,
                        onPressed: (SettingsCategory category) => openSetting(category),
                      );
                    }).toList(),
                  );
                } else {
                  return Column(
                    children: [
                      index > 0? Divider(
                        thickness: 1,
                        color: Theme.of(context).dividerColor,
                        indent: 32,
                        endIndent: 32,
                      ) : const SizedBox(height: 12),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 16),
                        itemCount: widget.groups[index].categories.length,
                        itemBuilder: (BuildContext context, int i) {
                          return CategoryCard(
                            category: widget.groups[index].categories[i],
                            targetPlatform: widget.targetPlatform,
                            onPressed: (SettingsCategory category) => openSetting(category),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
