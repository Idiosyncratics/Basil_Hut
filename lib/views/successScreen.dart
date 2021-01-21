import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {

  String regID;
  SuccessScreen(this.regID);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Text(regID)
        ),
      ),
    );
  }
}
