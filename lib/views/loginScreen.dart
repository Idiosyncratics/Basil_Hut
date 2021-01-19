import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF2994A),
            Color(0xffF2C94C),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/BasilHutLogo.png'),
              SizedBox(
                height: 45,
              ),
              ButtonTheme(
                minWidth: 160,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    print("Pressed 1");
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
                  ),
                  color: Color(0xff264653),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonTheme(
                minWidth: 160,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    print("Pressed 2");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
                  ),
                  color: Color(0xff264653),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
