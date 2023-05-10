// ignore_for_file: body_might_complete_normally_nullable

import 'package:challengebessiha/core/constants/app_route.dart';
import 'package:challengebessiha/views/screens/auth/Phone_verification_screen.dart';
import 'package:challengebessiha/views/screens/auth/login_screen.dart';
import 'package:challengebessiha/views/screens/favourit_screen.dart';
import 'package:challengebessiha/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouterManager {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Approute.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Approute.otpScreen:
        return MaterialPageRoute(builder: (_) => const PhoneVerification());
      case Approute.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeCaracterScreen());
      case Approute.favourit:
        return MaterialPageRoute(builder: (_) => const FavouritScreen());
    }
  }
}
