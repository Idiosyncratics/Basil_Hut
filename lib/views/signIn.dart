import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/backend/bhUser.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/views/menuScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethods auth = new AuthMethods();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInUser() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await auth.signInWithEmailAndPassword(
          emailController.text, passwordController.text).then((res){
            if(res!=null){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen()));
            }
      });
      //TODO Display SnackBar & Error
      //Signed In
      //TODO Redirect to Menu Screen (pushReplacement)


      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? showLoadingScreen()
        : Container(
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
                            style: pageHeadingTextFieldStyle(),
                          ),
                        ),
                      ),
                      Form(
                          key: formKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              children: [
                                //Email
                                TextFormField(
                                    controller: emailController,
                                    validator: (val) {
                                      return RegExp(// Escape Character: \
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(val)
                                          ? null
                                          : "Please enter a valid email";
                                    },
                                    decoration:
                                        inputTextFieldDecoration("Email"),
                                    style: inputTextFieldStyle()),
                                SizedBox(
                                  height: 30,
                                ),

                                //Password
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  validator: (val) {
                                    return val.isNotEmpty
                                        ? null
                                        : "Please enter your password";
                                  },
                                  decoration:
                                      inputTextFieldDecoration("Password"),
                                  style: inputTextFieldStyle(),
                                ),

                                //Forgot Password
                                Container(
                                  alignment: Alignment.centerRight,
                                  height: 70,
                                  child: GestureDetector(
                                    onTap: () {}, //TODO Forgot Password,
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: getLogoColor(),
                                          fontSize: 17,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                //Sign In
                                ButtonTheme(
                                  minWidth: 160,
                                  height: 40,
                                  child: RaisedButton(
                                    onPressed: () {
                                      signInUser();
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: buttonTextStyle(),
                                    ),
                                    color: getLogoColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                ),

                                //Create an account
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "New to Basil Hut?",
                                        style: TextStyle(
                                            color: getLogoColor(),
                                            fontSize: 16,
                                        fontFamily: "Poppins"),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUp()));
                                        },
                                        child: Text(
                                          "Create an account.",
                                          style: TextStyle(
                                              color: getLogoColor(),
                                              fontSize: 17,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
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
