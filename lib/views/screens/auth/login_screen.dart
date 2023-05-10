// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_local_variable, must_be_immutable, use_build_context_synchronously, depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_dimension.dart';
import 'package:challengebessiha/core/constants/app_image.dart';
import 'package:challengebessiha/core/constants/app_route.dart';
import 'package:challengebessiha/providers/otp_provider.dart';
import 'package:challengebessiha/services/otp_services.dart';
import 'package:challengebessiha/views/widgets/button_app.dart';
import 'package:challengebessiha/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorApp.scafoldColor,
        height: 60,
        alignment: Alignment.center,
        child: TextUtils(
            size: 18,
            color: ColorApp.colorPrimary,
            weight: FontWeight.w600,
            text: "Marvel App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionApp.padding1),
          child: Center(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: LottieBuilder.asset(
                      ImagesApp.loginLottie,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: DimensionApp.padding3,
                  ),
                  _buildPhoneFormField(context),
                  SizedBox(
                    height: DimensionApp.padding2,
                  ),
                  ButtonApp(
                      validate: () async {
                        if (globalKey.currentState!.validate()) {
                          var phone = context.read<OtpProvider>().getphone;

                          await OtpServices().verifyNumber(
                              phonenumber: phone, context: context);
                          Navigator.pushNamed(context, Approute.otpScreen);
                        }
                      },
                      title: "Connecter"),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Approute.homeScreen);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: ColorApp.colorPrimary),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPhoneFormField(BuildContext context) {
  TextEditingController phoneController = TextEditingController();

  String phoneNumber = "";

  String codeCountry = "+213";
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: ColorApp.scafoldColor,
                borderRadius: BorderRadius.circular(15)),
            height: 70,
            child: IntlPhoneField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone_android,
                    color: ColorApp.colorPrimary,
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.transparent,
                    size: 26,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: ColorApp.colorPrimary),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: "Numéro de Téléphone"),
              initialCountryCode: 'DZ',
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
              onSubmitted: (p0) {
                phoneNumber = "$codeCountry$p0";
                var provider = Provider.of<OtpProvider>(context, listen: false);
                provider.changePhone(myPhone: phoneNumber);
              },
              onCountryChanged: (value) {
                codeCountry = "+${value.dialCode}";
              },
              validator: (p0) {
                if (phoneNumber.isEmpty) {
                  return "Champ Obligatoire";
                }
                return null;
              },
            ),
          ))
    ],
  );
}
