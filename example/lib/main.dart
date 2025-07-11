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
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        dividerColor: Colors.grey.shade900,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.green.shade700,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        dividerColor: Colors.grey.shade300,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.green.shade700,
        ),
      ),
      home: const MyHomePage(title: 'Behrd Example', targetPlatform: DeviceType.auto),
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
              title: "Email reminders",
              value: true,
              onChanged: (val) {},
              isPrimary: true,
              style: OnOffSettingStyle.checkBox,
              icon: Icons.email,
            ),
            OnOffSetting(
              title: "Push Notifications",
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
          SettingsCategory(title: "Language & Region", icon: Icons.translate, settings: [
            StringSelectionSetting(
              title: "System language",
              selections: ["English", "Spanish", "Danish", "French"],
              onChanged: (val) {},
              value: "English",
              isPrimary: true,
              cupertinoStyle: StringSelectionSettingCupertinoStyle.check,
            ),
            StringSelectionSetting(
              title: "Region",
              selections: ["Great Britain", "United States", "Denmark", "France"],
              onChanged: (val) {},
              value: "Denmark",
              isPrimary: false,
              cupertinoStyle: StringSelectionSettingCupertinoStyle.check,
            ),
          ]),
          SettingsCategory(title: "Info", icon: Icons.info, settings: [
            InfoSetting(
              title: "Version",
              value: "0.0.1",
              isPrimary: true,
            ),
            InfoSetting(
              title: "Updated",
              value: "January 27th, 2025",
              isPrimary: true,
            ),
          ]),
        ],
        title: "App",
      ),
      SettingsCategoryGroup(
        categories: [
          SettingsCategory(title: "Account", icon: Icons.account_circle, settings: [
            TextSetting(title: "First name", onChanged: (val) {}, value: "John", isPrimary: true, icon: Icons.person),
            TextSetting(title: "Last name", onChanged: (val) {}, value: "Doe", isPrimary: true, icon: Icons.person),
          ]),
        ],
        title: "Account",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: BehrdNativeAppBar(title: "Home", targetPlatform: widget.targetPlatform),
     //appBar: BehrdNativeSliverAppBar(title: "Home", targetPlatform: widget.targetPlatform),
      body: CustomScrollView(
        slivers: [
          BehrdNativeSliverAppBar(title: "Home", targetPlatform: widget.targetPlatform),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 96),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BehrdNativeStaticLoading(targetPlatform: DeviceType.iOS, size: 24),
                      BehrdNativeStaticLoading(targetPlatform: DeviceType.android, size: 24),
                    ],
                  ),
                  const SizedBox(height: 24),
                  BehrdNativeTextButton(
                    title: "Open settings",
                    targetPlatform: widget.targetPlatform,
                    onPressed: () => settings.open(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
