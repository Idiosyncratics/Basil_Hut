import 'package:flutter/material.dart';
import './views/loginScreen.dart';

void main() => runApp(Basil_Hut());

class Basil_Hut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
