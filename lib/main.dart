import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bloodon/Controleurs/utils/store/theme_store.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
SharedPreferences sharedPreferences;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterBackgroundLocation.startLocationService();
  sharedPreferences= await SharedPreferences.getInstance();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  return runApp(
    Provider(
      create: (_) => ThemeStore(),
      child: MyApp(),
    ),
  );
}
