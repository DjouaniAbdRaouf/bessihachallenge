// ignore_for_file: implementation_imports, file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void alertdialog(
    {required BuildContext context,
    required String title,
    required DialogType dialogType,
    String desc = ""}) {
  AwesomeDialog(
          context: context, title: title, dialogType: dialogType, desc: desc)
      .show();
}
