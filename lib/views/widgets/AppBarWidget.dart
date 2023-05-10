// ignore_for_file: file_names

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appbarWidget({required String text}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
    foregroundColor: Colors.grey.shade900,
    backgroundColor: ColorApp.colorPrimary,
    elevation: 0.0,
    centerTitle: true,
    title: TextUtils(
        size: 20.0, color: Colors.white, weight: FontWeight.w600, text: text),
  );
}
