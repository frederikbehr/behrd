import 'package:behrd/behrd.dart';

class SettingsCategoryGroup {
  final String? title;
  final List<SettingsCategory> categories;
  const SettingsCategoryGroup({
    this.title = "Category",
    required this.categories,
  });
}