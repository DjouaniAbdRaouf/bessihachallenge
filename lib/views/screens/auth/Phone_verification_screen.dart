// ignore_for_file: file_names, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_dimension.dart';
import 'package:challengebessiha/core/constants/app_image.dart';
import 'package:challengebessiha/core/constants/app_route.dart';
import 'package:challengebessiha/providers/otp_provider.dart';
import 'package:challengebessiha/services/otp_services.dart';
import 'package:challengebessiha/views/widgets/AppBarWidget.dart';
import 'package:challengebessiha/views/widgets/AwsomeDialog.dart';
import 'package:challengebessiha/views/widgets/button_app.dart';
import 'package:challengebessiha/views/widgets/otp_widget.dart';
import 'package:challengebessiha/views/widgets/text_utils.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(text: "Vérification du Téléphone"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 261,
                child: SvgPicture.asset(ImagesApp.otp),
              ),
              SizedBox(
                height: DimensionApp.padding2,
              ),
              TextUtils(
                  size: 22.0,
                  color: ColorApp.blackTextColor,
                  weight: FontWeight.w800,
                  text: "Patientez Svp !"),
              SizedBox(
                height: DimensionApp.padding3,
              ),
              Consumer<OtpProvider>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          size: 18,
                          color: ColorApp.blackTextColor,
                          weight: FontWeight.w600,
                          text: "Entrez le code envoyé à "),
                      TextUtils(
                          size: 18,
                          color: ColorApp.blackTextColor,
                          weight: FontWeight.w600,
                          text: value.getphone),
                    ],
                  );
                },
              ),
              SizedBox(
                height: DimensionApp.padding1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      size: 18,
                      color: ColorApp.blackTextColor,
                      weight: FontWeight.w400,
                      text: "Vous n'avais pas reçu le Code "),
                  InkWell(
                    onTap: () => OtpServices().verifyNumber(
                        phonenumber: context.read<OtpProvider>().phone,
                        context: context),
                    child: TextUtils(
                        size: 18,
                        color: ColorApp.colorPrimary,
                        weight: FontWeight.w400,
                        text: " Renvoyer"),
                  ),
                ],
              ),
              SizedBox(
                height: DimensionApp.padding2,
              ),
              const OtpWidget(),
              SizedBox(
                height: DimensionApp.padding2,
              ),
              ButtonApp(
                  validate: () async {
                    String codeOtp = context.read<OtpProvider>().getOtpCode;
                    String verifyid = context.read<OtpProvider>().getVerifyCode;
                    print(codeOtp);
                    var response = await OtpServices().verifyOTP(
                        context: context, otpcode: codeOtp, veriyid: verifyid);
                    if (response) {
                      alertdialog(
                          context: context,
                          title: "Succès",
                          dialogType: DialogType.success);
                      Navigator.pushNamedAndRemoveUntil(
                          context, Approute.homeScreen, (route) => false);
                    } else {
                      alertdialog(
                          context: context,
                          title: "Failed",
                          desc: "OTP Incorrect",
                          dialogType: DialogType.error);
                    }
                  },
                  // validate: () => Navigator.pushNamedAndRemoveUntil(context,
                  //     Approute.homeScreen, (Route<dynamic> route) => false),
                  title: "Verifier")
            ],
          ),
        ),
      ),
    );
  }
}
