import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUsingEmailAndPassword(String email, String password) async{
    try{
      UserCredential queryResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= queryResult.user;
      return user.email;
    }
    catch(e){
      print(e);
    }
  }
}