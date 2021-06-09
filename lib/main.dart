import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/homeScreen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BasilHut());
}

class BasilHut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

/*
Create APK: flutter build apk --split-per-abi
Path: *Project Path*\build\app\outputs\flutter-apk\app-armeabi-v7a-release.apk
 */