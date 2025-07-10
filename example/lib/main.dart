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
      home: const MyHomePage(title: 'Behrd Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BehrdSettings settings = BehrdSettings(
    targetPlatform: DeviceType.iOS,
    categories: [
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
          SettingsCategory(title: "Theme", icon: Icons.dark_mode, settings: [
            OnOffSetting(title: "Theme", value: true, onChanged: (val) {}, isPrimary: true, onHint: "Dark", offHint: "Light"),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => settings.open(context), child: Text("Open settings")),
          ],
        ),
      ),
    );
  }
}
