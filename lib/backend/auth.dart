import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';

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
      String error="";
      if (e.code == 'user-not-found') {
        error='No user found for that email';
      } else if (e.code == 'wrong-password') {
        error='Wrong password provided for that user';
      } else
        error=e.code;
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
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return firebaseUser.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else
        print(e);
    }
    return null;
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
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
