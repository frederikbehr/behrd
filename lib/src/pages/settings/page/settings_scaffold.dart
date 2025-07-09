import 'package:behrd/src/pages/settings/page/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/device_type.dart';
import '../category/settings_category.dart';

class SettingsPage extends StatefulWidget {
  final DeviceType targetPlatform;
  final List<SettingsCategory> categories;
  final String title;

  const SettingsPage({
    super.key,
    required this.targetPlatform,
    required this.categories,
    required this.title,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void openSetting(SettingsCategory category) {
    debugPrint("opening ${category.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 24, bottom: 72),
              itemCount: widget.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: widget.categories[index],
                  deviceType: widget.targetPlatform,
                  onPressed: (SettingsCategory category) {
                    HapticFeedback.lightImpact();
                    openSetting(category);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
