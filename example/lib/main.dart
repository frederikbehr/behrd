import 'package:behrd/behrd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Behrd Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: Colors.grey.shade300,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade700,
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(title: 'Behrd Example', targetPlatform: DeviceType.android),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final DeviceType targetPlatform;
  const MyHomePage({super.key, required this.title, required this.targetPlatform});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final BehrdSettings settings = BehrdSettings(
    targetPlatform: widget.targetPlatform,
    previousPageTitle: "Home",
    groups: [
      SettingsCategoryGroup(
        categories: [
          SettingsCategory(title: "Notifications", icon: Icons.notifications, settings: [
            OnOffSetting(
              title: "Receive emails",
              value: true,
              onChanged: (val) {},
              isPrimary: true,
              style: OnOffSettingStyle.checkBox,
              icon: Icons.email,
            ),
            OnOffSetting(
              title: "Receive Push Notifications",
              value: false,
              onChanged: (val) {},
              isPrimary: true,
              style: OnOffSettingStyle.nativeSwitch,
              icon: Icons.notifications,
            ),
          ]),
          SettingsCategory(title: "Dark mode", icon: Icons.dark_mode, settings: [
            OnOffSetting(title: "Dark mode", value: false, onChanged: (val) {}, isPrimary: true, onHint: "Dark", offHint: "Light"),
          ]),
          SettingsCategory(title: "Language", icon: Icons.translate, settings: [
            StringSelectionSetting(title: "Language", selections: ["English", "Spanish"], onChanged: (val) {}, value: "English", isPrimary: true),
          ]),
        ],
        title: "App",
      ),
      SettingsCategoryGroup(
        categories: [
          SettingsCategory(title: "Account", icon: Icons.account_circle, settings: [
            TextSetting(title: "Name", onChanged: (val) {}, value: "John Doe", isPrimary: true),
          ]),
        ],
        title: "Account",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BehrdNativeAppBar(title: "Home", targetPlatform: widget.targetPlatform),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BehrdNativeStaticLoading(targetPlatform: DeviceType.iOS, size: 24),
                BehrdNativeStaticLoading(targetPlatform: DeviceType.android, size: 24),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => settings.open(context), child: Text("Open settings")),
          ],
        ),
      ),
    );
  }
}
