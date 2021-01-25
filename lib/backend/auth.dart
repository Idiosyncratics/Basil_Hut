import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/views/homeScreen.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password, BuildContext mainContext) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      print("Sign In Successful");
      return firebaseUser.email;
    } on FirebaseAuthException catch (e) {
      String error = "";
      if (e.code == 'user-not-found') {
        error = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user';
      } else
        error = e.code;
      showDialog(
        context: mainContext,
        builder: (context) => new AlertDialog(
          title: new Text('Couldn\'t sign in', style: userInfoTextStyle()),
          content: new Text(error, style: inputTextFieldStyle()),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('OK'),
            ),
          ],
        ),
      );
    }
    return null;
  }

  Future<String> signUpWithEmailAndPassword(
      String email, String password, BuildContext mainContext) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      Text txtBox = Text("Click on the link sent at " + email,
          style: inputTextFieldStyle());

      _auth.currentUser.sendEmailVerification();
      await showDialog(
          context: mainContext,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title:
                      new Text('Verify your email', style: userInfoTextStyle()),
                  content: txtBox,
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        _auth.currentUser.delete();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: new Text('Return'),
                    ),
                    new FlatButton(
                      onPressed: () async {
                        await _auth.currentUser.reload();
                        setState(() {
                          print("Verified: " +
                              _auth.currentUser.emailVerified.toString());
                          if (_auth.currentUser.emailVerified)
                            Navigator.of(context).pop(false);
                          else {
                            txtBox = Text("User " + email + " not verified yet",
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 18,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w200));
                          }
                        });
                      },
                      child: new Text('Proceed'),
                    ),
                  ],
                );
              }));
      return firebaseUser.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: mainContext,
          builder: (context) => new AlertDialog(
            title:
                new Text('Couldn\'t sign you up', style: userInfoTextStyle()),
            content: new Text('The account already exists for that email.',
                style: inputTextFieldStyle()),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false),
                child: new Text('OK'),
              ),
            ],
          ),
        );
      } else
        print(e);
    }
    return null;
  }

  Future<bool> resetPassword(String email, BuildContext mainContext) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      if(e.code=="user-not-found"){
        showDialog(
          context: mainContext,
          builder: (context) => new AlertDialog(
            title:
            new Text('No user found', style: userInfoTextStyle()),
            content: new Text('We couldn\'t find an account for that email',
                style: inputTextFieldStyle()),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('OK'),
              ),
            ],
          ),
        );
      }
      else
        print(e.code);
    }
    return false;
  }

  Future signOut() async {
    try {
      print("Current User: " +
          FirebaseAuth.instance.currentUser.email +
          " Signed Out Successfully");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
