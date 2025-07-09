import 'package:behrd/src/pages/settings/setting/setting.dart';

class TextSetting implements Setting {

  @override
  final bool isPrimary;

  @override
  final String title;

  String value;

  final Function(bool) onChanged;

  TextSetting({
    required this.title,
    this.isPrimary = false,
    required this.onChanged,
    required this.value,
  });

  @override
  String? getPrimaryStringValue() => value;

}