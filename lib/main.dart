import 'package:flutter/material.dart';

void main() => runApp(LogInScreen());

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('images/BasilHutLogo.png'),
          ],
        ),
      ),
    ));
  }
}
