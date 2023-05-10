// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {super.key,
      required this.size,
      required this.color,
      required this.weight,
      this.textAlign = TextAlign.center,
      required this.text});
  final double size;
  final Color color;
  final String text;
  final FontWeight weight;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
      textAlign: textAlign,
    );
  }
}
