import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';
import './signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 300,
                    width: 400,
                    child: Image.asset('images/BasilHutIcon.png')),

                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff153745)),
                    ),
                  ),
                ),

                Form(
                    child: Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                          decoration: inputTextFieldDecoration("Email"),
                          style: inputTextFieldStyle()),
                      SizedBox(
                        height: 30,
                      ),
                      //Password
                      TextFormField(
                        decoration: inputTextFieldDecoration("Password"),
                        style: inputTextFieldStyle(),
                      ),
                      //Forgot Password
                      Container(
                        height: 70,
                        padding: EdgeInsets.only(left: 193, bottom: 10),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {}, //TODO Forgot Password,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: getLogoColor(),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      //Sign In
                      ButtonTheme(
                        minWidth: 160,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            //TODO Authentication (Sign In)
                          },
                          child: Text(
                            "Sign In",
                            style:
                                TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
                          ),
                          color: getLogoColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      //Create an account
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New to Basil Hut? ",
                              style: TextStyle(
                                  color: getLogoColor(), fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                              },
                              child: Text(
                                "Create an account.",
                                style: TextStyle(
                                    color: getLogoColor(),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
