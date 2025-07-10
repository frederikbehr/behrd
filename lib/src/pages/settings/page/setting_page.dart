import 'package:behrd/behrd.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final SettingsCategory category;
  final DeviceType targetPlatform;
  const SettingPage({
    super.key,
    required this.category,
    required this.targetPlatform,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
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
