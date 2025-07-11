import 'package:behrd/behrd.dart';
import 'package:behrd/src/components/native_radio/native_radio.dart';
import 'package:behrd/src/pages/settings/setting/string/string_selection_setting_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StringSelectionSettingWidget extends StatefulWidget {
  final StringSelectionSetting setting;
  final DeviceType targetPlatform;
  const StringSelectionSettingWidget({super.key, required this.setting, required this.targetPlatform});

  @override
  State<StringSelectionSettingWidget> createState() => _StringSelectionSettingWidgetState();
}

class _StringSelectionSettingWidgetState extends State<StringSelectionSettingWidget> {
  late String value;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  void load() {
    value = widget.setting.value;
    setState(() => isLoading = false);
  }

  void updateValue(String newValue) {
    setState(() => value = newValue);
    widget.setting.onChanged(newValue);
  }

  bool isSelected(String selection) => selection == value;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return SizedBox();
    if (widget.targetPlatform == DeviceType.iOS) {
      return CupertinoFormSection(
        header: Text(widget.setting.title),
        children: widget.setting.selections.map((selection) {
          return GestureDetector(
            onTap: () => updateValue(selection),
            behavior: HitTestBehavior.opaque,
            child: CupertinoFormRow(
              prefix: Row(
                children: [
                  widget.setting.cupertinoStyle != StringSelectionSettingCupertinoStyle.check ? Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: BehrdNativeRadio(
                      targetPlatform: widget.targetPlatform,
                      isOn: isSelected(selection),
                      size: 26,
                    ),
                  ) : const SizedBox(),
                  Text(
                    selection,
                  ),
                ],
              ),
              child: SizedBox(
                height: 36,
                child: widget.setting.cupertinoStyle == StringSelectionSettingCupertinoStyle.check? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: isSelected(selection)? 150 : 1), // avoid fade out, which is undesired
                      opacity: isSelected(selection)? 1 : 0,
                      child: Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 26,
                        color: widget.setting.iconColor ?? CupertinoColors.activeBlue,
                      ),
                    ),
                  ],
                ) : const SizedBox(),
              ),
            ),
          );
        }).toList(),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0, bottom: 8),
            child: Text(widget.setting.title),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.setting.selections.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => updateValue(widget.setting.selections[index]),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 24.0),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: BehrdNativeRadio(
                                targetPlatform: widget.targetPlatform,
                                isOn: isSelected(widget.setting.selections[index]),
                                size: 26,
                              ),
                            ),
                          ),
                          Text(
                            widget.setting.selections[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
