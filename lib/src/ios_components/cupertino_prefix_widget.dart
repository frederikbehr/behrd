import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPrefixWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;

  const CupertinoPrefixWidget({super.key, required this.icon, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color ?? CupertinoColors.systemBlue,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).brightness == Brightness.light? Colors.white : Colors.black54,
          ),
        ),
        const SizedBox(width: 15),
        Text(title),
      ],
    );
  }
}