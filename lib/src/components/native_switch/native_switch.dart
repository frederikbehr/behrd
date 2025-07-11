import 'package:behrd/behrd.dart';
import 'package:behrd/src/utils/target_platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BehrdNativeSwitch extends StatefulWidget {
  final DeviceType targetPlatform;
  final bool initialValue;
  final Function(bool) onChanged;
  const BehrdNativeSwitch({
    super.key,
    required this.targetPlatform,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<BehrdNativeSwitch> createState() => _BehrdNativeSwitchState();
}

class _BehrdNativeSwitchState extends State<BehrdNativeSwitch> {
  bool isLoading = true;
  late bool value;
  late DeviceType targetPlatform;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  void load() {
    value = widget.initialValue;
    targetPlatform = TargetPlatformUtils.determinePlatform(widget.targetPlatform);
    setState(() => isLoading = false);
  }

  void updateValue(bool newValue) {
    setState(() => value = newValue);
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return SizedBox();
    if (targetPlatform == DeviceType.iOS) {
      return SizedBox(
        height: 26,
        child: CupertinoSwitch(
          value: value,
          onChanged: (val) => updateValue(val),
        ),
      );
    } else {
      return Switch(
        value: value,
        onChanged: (val) => updateValue(val),
      );
    }
  }
}
