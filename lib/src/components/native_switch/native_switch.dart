import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../loading/native_static_loading.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  void load() {
    value = widget.initialValue;
    setState(() => isLoading = false);
  }

  void updateValue(bool newValue) {
    setState(() => value = newValue);
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return BehrdNativeStaticLoading(targetPlatform: widget.targetPlatform, size: 50);

    if (widget.targetPlatform == DeviceType.iOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: (val) => updateValue(val),
      );
    } else {
      return Switch(
        value: value,
        onChanged: (val) => updateValue(val),
      );
    }
  }
}
