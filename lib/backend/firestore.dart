import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:basil_hut/backend/bhUser.dart';
import 'dart:io';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  FirebaseStorage firebase_storage = FirebaseStorage.instance;

  Future<BHUser> addNewUserData(String fullName, String orgName, String eId,
      String email, String mob, String idURL) async {
    BHUser newBHUser;
    User currFirebaseUser = FirebaseAuth.instance.currentUser;
    await usersCollection.doc(email).set({
      "Reg ID": "",
      "Email": currFirebaseUser.email,
      "Employee ID": eId,
      "Full Name": fullName,
      //TODO Upload ID Card & Attach Link Here
      "Mobile No": "91" + mob,
      "Organization Name": orgName,
      "Registration Details": currFirebaseUser.metadata.creationTime,
    }).then((value) async {
      print("User Data Added to Firestore");
      //access & update count, set Custom ID
      final DocumentReference document = usersCollection.doc('UserCount');
      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        dynamic length = snapshot.get('Count');
        usersCollection
            .doc(email)
            .update({'Reg ID': "BH_User_" + (length + 1).toString()});
        usersCollection.doc('UserCount').update({'Count': (length + 1)});
        newBHUser = new BHUser(email, "BH_User_" + (length + 1).toString());
      }).then((value) async {
        await uploadFile(idURL, email).then((value) => print(
            "Document created, Count updated & ID uploaded - addNewUserData() completed"));
      });
    }).catchError(
        (error) => print("addNewUserData() failed with error: $error"));
    if (newBHUser != null) {
      return newBHUser;
    }
  }

  Future<void> uploadFile(String filePath, String email) async {
    print("ID Card upload started");
    File file = File(filePath);
    try {
      await firebase_storage
          .ref('User Files/ID Cards/$email.png')
          .putFile(file);
      print("Upload successful");
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  String getBHUserDetails() {
    return FirebaseAuth.instance.currentUser.email;
  }
}
