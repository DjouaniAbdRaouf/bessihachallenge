// ignore_for_file: prefer_const_constructors

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, required this.validate, required this.title});

  final Function validate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.colorPrimary,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () async {
          validate();
        },
        child: TextUtils(
          size: 18.0,
          weight: FontWeight.w600,
          text: title,
          color: Colors.white,
        ),
      ),
    );
  }
}
