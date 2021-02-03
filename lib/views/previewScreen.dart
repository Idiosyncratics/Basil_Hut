import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/main.dart';
import 'package:basil_hut/views/successScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/views/homeScreen.dart';
import 'package:basil_hut/backend/firestore.dart';
import 'dart:io';

class PreviewScreen extends StatefulWidget {
  String fullName, orgName, eId, email, password, mobNo, idCard;

  PreviewScreen(this.fullName, this.orgName, this.eId, this.email,
      this.password, this.mobNo, this.idCard);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  AuthMethods auth = new AuthMethods();
  FirestoreMethods firestoreMethods = new FirestoreMethods();
  bool isLoading = false;

  //For registering user
  registerUser(BuildContext mainContext) async {
    setState(() {
      isLoading = true;
    });
    print("Started Process - Sign Up User");
    final String result =
        await auth.signUpWithEmailAndPassword(widget.email, widget.password, mainContext);
    if (result == null) {
      print('Sign Up failed');
      setState(() {
        isLoading = false;
      });
      //TODO Display SnackBar & Error
    } else {
      //Signed Up & also Signed In automatically
      print("Sign Up succeeded -> Signed In. Adding data to firestore");
      await firestoreMethods
          .addNewUserData(widget.fullName, widget.orgName, widget.eId,
              widget.email, widget.mobNo, widget.idCard)
          .then((newBHUser) async {
        Navigator.of(context).pushReplacement(//TODO Change to pushReplacement
            MaterialPageRoute(builder: (context) => SuccessScreen(newBHUser.currUserRegID)));
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  //For back button functionality
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Return to home screen?', style: userInfoTextStyle()),
            content: new Text('Form data will be lost.', style: inputTextFieldStyle()),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? showLoadingScreen()
        : Container(
            decoration: getGradient(),
            child: WillPopScope(
              onWillPop: _onWillPop,
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
                              "A Quick Check",
                              style: pageHeadingTextFieldStyle(),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[100]),
                          padding: EdgeInsets.all(25),
                          width: MediaQuery.of(context).size.width - 40,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        makePreviewField("Full Name"),
                                        SizedBox(height: 20),
                                        makePreviewField("Org Name"),
                                        SizedBox(height: 20),
                                        makePreviewField("Emp ID"),
                                        SizedBox(height: 20),
                                        makePreviewField("Email"),
                                        SizedBox(height: 20),
                                        makePreviewField("Mob No"),
                                        SizedBox(height: 20),
                                        makePreviewField("ID Card"),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        makePreviewValue(widget.fullName),
                                        SizedBox(height: 20),
                                        makePreviewValue(widget.orgName),
                                        SizedBox(height: 20),
                                        makePreviewValue(widget.eId),
                                        SizedBox(height: 20),
                                        makePreviewValue(widget.email),
                                        SizedBox(height: 20),
                                        makePreviewValue("91"+widget.mobNo.toString()),
                                        SizedBox(height: 20),
                                        makePreviewValue(""),
                                        SizedBox(height: 20),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 200,
                                child: ClipRRect(
                                    child: Image.file(File(widget.idCard)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          margin: EdgeInsets.only(top: 40, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonTheme(
                                minWidth: 160,
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Edit",
                                    style: buttonTextStyle(),
                                  ),
                                  color: getLogoColor(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 160,
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {
                                    registerUser(context);
                                  },
                                  child: Text(
                                    "Submit",
                                    style: buttonTextStyle(),
                                  ),
                                  color: getLogoColor(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
