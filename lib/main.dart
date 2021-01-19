import 'package:flutter/material.dart';
import './views/loginScreen.dart';

void main() => runApp(BasilHut());

class BasilHut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
