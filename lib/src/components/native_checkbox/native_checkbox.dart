import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class BehrdNativeCheckbox extends StatefulWidget {
  final DeviceType targetPlatform;
  final bool initialValue;
  final Function(bool) onChanged;
  final double size;
  const BehrdNativeCheckbox({
    super.key,
    required this.targetPlatform,
    required this.initialValue,
    required this.onChanged,
    required this.size,
  });

  @override
  State<BehrdNativeCheckbox> createState() => _BehrdNativeCheckboxState();
}

class _BehrdNativeCheckboxState extends State<BehrdNativeCheckbox> {
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
    if (widget.targetPlatform == DeviceType.auto) {
      targetPlatform = Platform.isIOS? DeviceType.iOS : DeviceType.android;
    } else {
      targetPlatform = widget.targetPlatform; // No need to determine platform.
    }
    setState(() => isLoading = false);
  }

  void updateValue(bool newValue) {
    setState(() => value = newValue);
    widget.onChanged(newValue);
  }

  double getScale() => widget.size / 18; // 18 = default size

  @override
  Widget build(BuildContext context) {
    if (isLoading) return SizedBox();
    return Transform.scale(
      scale: getScale(),
      child: widget.targetPlatform == DeviceType.iOS? CupertinoCheckbox(
        value: value,
        onChanged: (val) {
          if (val != null) updateValue(val);
        },
      ) : Checkbox(
        value: value,
        onChanged: (val) {
          if (val != null) updateValue(val);
        },
      ),
    );
  }
}
