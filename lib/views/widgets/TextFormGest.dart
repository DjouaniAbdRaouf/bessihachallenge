// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class TextFormGest extends StatelessWidget {
  TextFormGest(
      {Key? key,
      required this.controller,
      required this.errormessage,
      this.icon,
      this.obscure = false,
      this.textInputtype = TextInputType.text,
      this.coloprefix,
      this.colorFill = Colors.white,
      this.textLine = 1,
      this.colosuffixIcon,
      required this.hinttext,
      this.suffixIcon,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController controller;
  final String errormessage;
  final IconData? icon;
  final IconData? suffixIcon;
  final Color colorFill;
  final Color? colosuffixIcon;
  final Color? coloprefix;
  final String hinttext;
  final int textLine;
  TextInputType? textInputtype;
  bool obscure;
  bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      decoration: BoxDecoration(
          color: colorFill, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        maxLines: textLine,
        obscureText: obscure,
        readOnly: readOnly,
        controller: controller,
        keyboardType: textInputtype,
        validator: (value) {
          if (value == "") {
            return "Champ Obligatoire";
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: colosuffixIcon ?? ColorApp.colorgrey,
            ),
            prefixIcon: Icon(
              icon,
              color: coloprefix ?? Colors.transparent,
              size: 26,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ColorApp.colorgrey),
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ColorApp.colorgrey),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ColorApp.colorgrey),
              borderRadius: BorderRadius.circular(30),
            ),
            labelText: hinttext),
      ),
    );
  }
}
