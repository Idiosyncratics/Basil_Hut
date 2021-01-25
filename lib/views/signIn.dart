import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/views/menuScreen.dart';
import './signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethods auth = new AuthMethods();
  bool isLoading = false;
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInUser(BuildContext mainContext) async {
    if (emailFormKey.currentState.validate() &&
        passwordFormKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await auth
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text, mainContext)
          .then((res) {
        if (res != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MenuScreen()));
        }
      });
      //TODO Display SnackBar & Error
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
                        key: emailFormKey,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            children: [
                              //Email
                              TextFormField(
                                  controller: emailController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (val) {
                                    return RegExp(// Escape Character: \
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                  decoration: inputTextFieldDecoration("Email"),
                                  style: inputTextFieldStyle()),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                          key: passwordFormKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              children: [
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
                                    onTap: () async {
                                      if (emailController.text.isEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => new AlertDialog(
                                            title: new Text('Reset Password',
                                                style: userInfoTextStyle()),
                                            content: new Text(
                                                'Enter your registered email ID in the '
                                                '\'Email\' field and click \'Forgot Password\'',
                                                style: inputTextFieldStyle()),
                                            actions: <Widget>[
                                              new FlatButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: new Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else if (emailFormKey.currentState
                                          .validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await auth
                                            .resetPassword(
                                                emailController.text, context)
                                            .then((noError) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          if(noError==true)
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                new AlertDialog(
                                              title: new Text('Reset link sent',
                                                  style: userInfoTextStyle()),
                                              content: new Text(
                                                  'Click on the link sent at ' +
                                                      emailController.text +
                                                      ' to reset your password',
                                                  style: inputTextFieldStyle()),
                                              actions: <Widget>[
                                                new FlatButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(false),
                                                  child: new Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                      }
                                    }, //TODO Forgot Password,
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
                                      signInUser(context);
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
