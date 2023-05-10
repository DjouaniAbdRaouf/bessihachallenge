// ignore_for_file: depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/providers/otp_provider.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        textStyle: const TextStyle(fontSize: 40),
        keyboardType: TextInputType.number,
        cursorColor: ColorApp.colorPrimary,
        pinTheme: PinTheme(
            fieldHeight: 80,
            fieldWidth: 40,
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            borderWidth: 2,
            activeColor: Colors.green,
            errorBorderColor: Colors.red,
            selectedColor: ColorApp.colorPrimary,
            inactiveColor: ColorApp.colorgrey),

        animationDuration: const Duration(milliseconds: 300),
        // errorAnimationController: errorController,
        // controller: textEditingController,
        onCompleted: (optCode) {
          print(optCode);
          var provider = Provider.of<OtpProvider>(context, listen: false);
          provider.changeOtpCode(otpCode: optCode);
        },
        onChanged: (value) {
          debugPrint(value);
        },

        appContext: context,
      ),
    );
  }
}
