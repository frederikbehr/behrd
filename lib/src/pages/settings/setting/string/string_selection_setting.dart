import 'package:behrd/src/pages/settings/setting/setting.dart';

class StringSelectionSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  String value;
  final List<String> selections;

  final Function(bool) onChanged;

  StringSelectionSetting({
    required this.title,
    required this.selections,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
  });

  @override
  String? getPrimaryStringValue() => value;

}