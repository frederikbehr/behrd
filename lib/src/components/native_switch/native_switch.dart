import 'package:behrd/behrd.dart';
import 'package:behrd/src/components/loading/static_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NativeSwitch extends StatefulWidget {
  final DeviceType targetPlatform;
  final bool value;
  final Function(bool) onChanged;
  const NativeSwitch({
    super.key,
    required this.targetPlatform,
    required this.value,
    required this.onChanged,
  });

  @override
  State<NativeSwitch> createState() => _NativeSwitchState();
}

class _NativeSwitchState extends State<NativeSwitch> {
  bool isLoading = true;
  late bool value;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  void load() {
    value = widget.value;
    setState(() => isLoading = false);
  }

  void updateValue(bool newValue) {
    setState(() => value = newValue);
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return StaticLoading(targetPlatform: widget.targetPlatform, size: 50);

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
