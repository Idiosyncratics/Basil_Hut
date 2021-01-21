import 'package:basil_hut/views/signUp.dart';
import 'package:basil_hut/views/successScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/views/homeScreen.dart';
import 'dart:io';

class PreviewScreen extends StatefulWidget {
  String fullName, orgName, eId, email, password;
  int mobNo;
  String idCard;

  PreviewScreen(
      {this.fullName,
      this.orgName,
      this.eId,
      this.email,
      this.password,
      this.mobNo,
      this.idCard});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  //For back button functionality
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Return to home screen?'),
            content: new Text('Form data will be lost.'),
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

  //For registering user
  registerUser(){
    //TODO Firebase Register User
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessScreen("abc")));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff153745)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    padding: EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width - 40,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                makePreviewValue(widget.fullName),
                                SizedBox(height: 20),
                                makePreviewValue(widget.orgName),
                                SizedBox(height: 20),
                                makePreviewValue(widget.eId),
                                SizedBox(height: 20),
                                makePreviewValue(widget.email),
                                SizedBox(height: 20),
                                makePreviewValue(widget.mobNo.toString()),
                                SizedBox(height: 20),
                                makePreviewValue(""),
                                SizedBox(height: 20),
                              ],
                            )
                          ],
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
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xffd8f3dc)),
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
                              registerUser();
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xffd8f3dc)),
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
