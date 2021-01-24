import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/views/menuScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import './signUp.dart';
import './signIn.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  Timer _timer;
  final int duration = 3;
  int _start;

  _HomeScreenState() {
    _start = duration;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            decoration: getGradient(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      "Signing in as:",
                      style: inputTextFieldStyle(),
                    )),
                    Center(
                        child: Text(
                      FirebaseAuth.instance.currentUser.email,
                      style: userInfoTextStyle(),
                    ))
                  ],
                ),
              ),
            ),
          )
        : Container(
            decoration: getGradient(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/BasilHutLogo.png',
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      ButtonTheme(
                        minWidth: 160,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            if (FirebaseAuth.instance.currentUser != null) {
                              //Show signing in as
                              const oneSec = const Duration(seconds: 1);
                              _timer = new Timer.periodic(
                                oneSec,
                                (Timer timer) {
                                  if (_start == 0) {
                                    setState(() {
                                      timer.cancel();
                                      _start = 10;
                                      isLoading = false;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuScreen()));
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                      _start--;
                                    });
                                  }
                                },
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: buttonTextStyle(),
                          ),
                          color: Color(0xff264653),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ButtonTheme(
                        minWidth: 160,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Sign Up",
                            style: buttonTextStyle(),
                          ),
                          color: Color(0xff264653),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
