import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _onBackgroundHandler(RemoteMessage message) async { //output
  //buat output
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Pesan: ${message.notification?.body}");
}

void _onMessageHandler(RemoteMessage message) { //output
  //dri remote
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Pesan: ${message.notification?.body}");
}

Future initializeNotif() async {
  final fcm = FirebaseMessaging.instance;

  FirebaseMessaging.instance //untuk mendapatkan tokennya
      .getToken()
      .then((value) => {print("Token: $value")});

  // foreground /akt
  FirebaseMessaging.onMessage.listen(_onMessageHandler);

  // background / mini
  FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);

  // onClicked . 
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('Message: ${message.data} clicked');
  });

  // terminated / clos
  final message = await fcm.getInitialMessage();
  if (message != null) {
    debugPrint("Data Notif: ${message.data}");
  }
}
