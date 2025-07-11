import 'package:behrd/behrd.dart';
import 'package:behrd/src/ios_components/cupertino_prefix_widget.dart';
import 'package:behrd/src/utils/target_platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BehrdNativeTextField extends StatelessWidget {
  final String? title;
  final Function(String) onChanged;
  final String? hintText;
  final bool autoFocus;
  final VoidCallback onSubmitted;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? initialValue;
  final Color? focusBorderColor;
  final Color? borderColor;
  final Color? cursorColor;
  final int? maxLength;
  final DeviceType targetPlatform;
  final IconData? icon;
  const BehrdNativeTextField({
    super.key,
    this.title,
    required this.onChanged,
    this.hintText,
    required this.autoFocus,
    required this.onSubmitted,
    required this.textInputType,
    this.controller,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.maxLines,
    this.initialValue,
    this.focusBorderColor,
    this.borderColor,
    this.cursorColor,
    this.maxLength,
    this.targetPlatform = DeviceType.auto,
    this.icon,
  });


  @override
  Widget build(BuildContext context) {
    final DeviceType platform = TargetPlatformUtils.determinePlatform(targetPlatform);
    if (platform == DeviceType.iOS) {
      return CupertinoTextFormFieldRow(
        prefix: title != null? Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: Text(title!),
        ) : null,
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (val) => onSubmitted(),
        obscureText: obscureText ?? false,
        validator: validator,
        cursorColor: cursorColor,
        onChanged: (val) => onChanged(val),
        autocorrect: false,
        initialValue: initialValue,
        enableSuggestions: true,
        maxLines: maxLines ?? 1,
        autofocus: autoFocus,
        maxLength: maxLength,
        keyboardType: textInputType,
        textCapitalization: TextCapitalization.none,
        keyboardAppearance: Theme.of(context).brightness,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (val) => onSubmitted(),
          obscureText: obscureText ?? false,
          validator: validator,
          cursorColor: cursorColor,
          onChanged: (val) => onChanged(val),
          autocorrect: false,
          initialValue: initialValue,
          enableSuggestions: true,
          maxLines: maxLines ?? 1,
          autofocus: autoFocus,
          maxLength: maxLength,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.none,
          keyboardAppearance: Theme.of(context).brightness,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: title,
            prefixIcon: icon != null? Icon(
              icon,
            ) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(),
            ),
            errorStyle: const TextStyle(color: Colors.red, fontSize: 14, height: 1),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),

          ),
        ),
      );
    }
  }
}
