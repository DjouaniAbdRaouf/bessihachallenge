// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:challengebessiha/providers/otp_provider.dart';
import 'package:provider/provider.dart';

class OtpServices {
  Future<void> verifyNumber(
      {required String phonenumber, required BuildContext context}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // cette phase déja testé par le package intl phone donc le numéro est valide
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        var provider = Provider.of<OtpProvider>(context, listen: false);
        provider.changeVerifyCode(verifyCode: verificationId);
        debugPrint(provider.getVerifyCode);
      },
      timeout: const Duration(seconds: 30),
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint(verificationId);
      },
    );
  }

  Future<bool> verifyOTP(
      {required String otpcode,
      required BuildContext context,
      required String veriyid}) async {
    try {
      UserCredential usercredential =
          await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: veriyid,
          smsCode: otpcode,
        ),
      );
      if (usercredential.user != null) {
        return true;
      }
      return false;
    } catch (e) {
      debugPrint("erroe msg when creating a credential $e");
      return false;
    }
  }
}
