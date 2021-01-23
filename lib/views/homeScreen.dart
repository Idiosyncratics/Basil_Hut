import 'package:basil_hut/backend/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import './signUp.dart';
import './signIn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //TODO Temp variable and name (remove later). Also remove the Log Out button
  bool signedIn = false;

  signOut() async {
    AuthMethods _auth = new AuthMethods();
    _auth.signOut();
    setState(() {
      signedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Container screen = Container(
      decoration: getGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/BasilHutLogo.png',
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  ButtonTheme(
                    minWidth: 160,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "Sign In",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Sign Up",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
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
                        if (FirebaseAuth.instance.currentUser != null) {
                          setState(() {
                            signedIn = true;
                            signOut();
                          });
                        } else {
                          print("No user signed in");
                        }
                      },
                      child: Text(
                        "Log Out (Temp)",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
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
      ),
    );

    return screen;
  }
}
