import 'package:behrd/behrd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class BehrdNativeRadio extends StatefulWidget {
  final DeviceType targetPlatform;
  final bool isOn;
  final double size;
  const BehrdNativeRadio({
    super.key,
    required this.targetPlatform,
    required this.isOn,
    required this.size,
  });

  @override
  State<BehrdNativeRadio> createState() => _BehrdNativeRadioState();
}

class _BehrdNativeRadioState extends State<BehrdNativeRadio> {
  bool isLoading = true;
  late DeviceType targetPlatform;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  void load() {
    if (widget.targetPlatform == DeviceType.auto) {
      targetPlatform = Platform.isIOS? DeviceType.iOS : DeviceType.android;
    } else {
      targetPlatform = widget.targetPlatform; // No need to determine platform.
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return SizedBox();
    return SizedBox(
      height: widget.size,
      child: IgnorePointer(
        child: widget.targetPlatform == DeviceType.iOS? CupertinoRadio(
          value: true,
          groupValue: widget.isOn,
          onChanged: (_) {},
        ) : Radio(
          value: true,
          groupValue: widget.isOn,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
