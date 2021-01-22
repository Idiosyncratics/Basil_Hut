import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {

  String regID;
  SuccessScreen(this.regID);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradient(),
      child: SafeArea(
        child: Scaffold(
          body: Center(child: Text(regID))
        ),
      ),
    );
  }
}
