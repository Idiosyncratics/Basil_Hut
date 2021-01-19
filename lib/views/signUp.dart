import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './signIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool fileUploaded = false;

  @override
  Widget build(BuildContext context) {
    String fileName = "No File Uploaded";
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

                //Sign Up Text
                Container(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Center(
                    child: Text(
                      "Sign Up",
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
                      //Full Name
                      TextFormField(
                          decoration: inputTextFieldDecoration("Full Name"),
                          style: inputTextFieldStyle()),
                      SizedBox(
                        height: 30,
                      ),

                      //Organization Name
                      TextFormField(
                        decoration:
                            inputTextFieldDecoration("Organization Name"),
                        style: inputTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //Employee ID
                      TextFormField(
                          decoration:
                              inputTextFieldDecoration("Employee ID No."),
                          style: inputTextFieldStyle()),
                      SizedBox(
                        height: 30,
                      ),

                      //Mobile No
                      TextFormField(
                          decoration: inputTextFieldDecoration("Mobile No."),
                          style: inputTextFieldStyle()),
                      SizedBox(
                        height: 30,
                      ),

                      //Email
                      TextFormField(
                        decoration: inputTextFieldDecoration("Email"),
                        style: inputTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //Password
                      TextFormField(
                        decoration: inputTextFieldDecoration("Password"),
                        style: inputTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //Confirm Password
                      TextFormField(
                        decoration:
                            inputTextFieldDecoration("Confirm Password"),
                        style: inputTextFieldStyle(),
                      ),

                      //Upload ID Card Text
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 43, bottom: 10),
                        child: Text(
                          "Upload ID Card",
                          style: inputTextFieldStyle(),
                        ),
                      ),

                      //Upload Button & File Name Text Field
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              //TODO Upload Option
                            },
                            child: Text(
                              "Choose a File",
                              style: TextStyle(
                                  fontSize: 16, color: getLogoColor()),
                            ),
                          ),
                          Text(
                            fileName,
                            style:
                                TextStyle(fontSize: 16, color: getLogoColor()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //Next Button
                      ButtonTheme(
                        minWidth: 160,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            //TODO Redirect to Preview
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffd8f3dc)),
                          ),
                          color: getLogoColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),

                      //Already Have An Account
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  color: getLogoColor(), fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text(
                                "Sign In.",
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
  }
}
