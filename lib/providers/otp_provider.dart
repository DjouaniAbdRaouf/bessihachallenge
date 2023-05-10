import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  String phone = "";
  String verifycode = "";
  String otpcode = "";

  String get getphone => phone;
  String get getVerifyCode => verifycode;
  String get getOtpCode => otpcode;

  void changePhone({required String myPhone}) {
    phone = myPhone;
    notifyListeners();
  }

  void changeOtpCode({required String otpCode}) {
    print(otpCode);
    otpcode = otpCode;
    notifyListeners();
  }

  void changeVerifyCode({required String verifyCode}) {
    verifycode = verifyCode;
    notifyListeners();
  }
}
