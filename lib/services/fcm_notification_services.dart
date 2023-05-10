// ignore_for_file: file_names

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsService {
  Future<NotificationsService> init() async {
    await _initializNotificationForGround();
    return this;
  }

  Future<void> _initializNotificationForGround() async {
    await FirebaseMessaging.instance.getInitialMessage();
  }
}
