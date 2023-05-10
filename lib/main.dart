// ignore_for_file: depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_route.dart';
import 'package:challengebessiha/providers/caracter_provider.dart';
import 'package:challengebessiha/providers/comics_provider.dart';
import 'package:challengebessiha/providers/favourit_provider.dart';
import 'package:challengebessiha/providers/otp_provider.dart';
import 'package:challengebessiha/route.dart';
import 'package:challengebessiha/services/fcm_notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen(firebaseMessagingForgroundHandler);
  await initializeSettings();
  runApp(MyApp(
    appRouterManager: AppRouterManager(),
  ));
}

Future<void> initializeSettings() async {
  FirebaseMessaging.instance.getToken().then((token) {
    //thats token to send push notification using fcm
    debugPrint(token);
  });
  await NotificationsService().init();
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("background messaging handler");
}

Future<void> firebaseMessagingForgroundHandler(RemoteMessage message) async {
  debugPrint("forground messaging handler ${message.data}");

  if (message.notification != null) {
    debugPrint("${message.notification!.title}");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouterManager});

  final AppRouterManager appRouterManager;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OtpProvider()),
        ChangeNotifierProvider(create: (context) => CharacterProvider()),
        ChangeNotifierProvider(create: (context) => FavouritProvider()),
        ChangeNotifierProvider(create: (context) => ComicsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: ColorApp.scafoldColor),
        initialRoute: Approute.loginScreen,
        onGenerateRoute: appRouterManager.generateRoute,
      ),
    );
  }
}
