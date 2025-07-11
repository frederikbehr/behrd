import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final SettingsCategory category;
  final String previousPageTitle;
  final DeviceType targetPlatform;
  const SettingPage({
    super.key,
    required this.category,
    required this.targetPlatform,
    required this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BehrdNativeAppBar(
        title: category.title,
        previousPageTitle: previousPageTitle,
        targetPlatform: targetPlatform,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            targetPlatform == DeviceType.iOS? CupertinoFormSection(
              children: category.settings.map((setting) {
                return setting.getWidget(targetPlatform);
              }).toList(),
            ) : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: category.settings.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return category.settings[index].getWidget(targetPlatform);
              },
            ),
          ],
        ),
      ),
    );
  }
}
