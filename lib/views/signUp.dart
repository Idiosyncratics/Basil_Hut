import 'package:basil_hut/views/previewScreen.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import './signIn.dart';
import 'dart:io'; //For file IO
import 'package:permission_handler/permission_handler.dart'; //For permissions (Add in AndroidManifest.xml)
import 'package:path/path.dart'; //For getting the file name from file path

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  TextEditingController empIdController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _imgPicker = ImagePicker();
  String pickedFilePath;
  String fileStatus = "No File Uploaded";
  bool retry = false;

  registerUser(BuildContext context) {
    if (formKey.currentState.validate() && fileStatus == "Image Uploaded") {
      passwordController.text = "";
      confirmPasswordController.text = "";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            fullName: fullNameController.text,
            orgName: orgNameController.text,
            eId: empIdController.text,
            mobNo: int.parse(mobNoController.text),
            email: emailController.text,
            password: passwordController.text,
            idCard: pickedFilePath,
          ),
        ),
      );
    } else {
      setState(() {
        retry = true;
      });
    }
  }

  uploadFile() async {
    if (await Permission.accessMediaLocation.request().isGranted) {
      final pickedFile = await _imgPicker.getImage(source: ImageSource.gallery);
      pickedFilePath=pickedFile.path;
      //TODO Complete Upload Function
      setState(() {
        File _imageFile = new File(pickedFile.path);
        retry = false;
        fileStatus = "Image Uploaded";
      });
    }
  }

  Color getFileTextColor() {
    if (retry && fileStatus == "No File Uploaded") {
      return Colors.red[800];
    }
    return getLogoColor();
  }

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
                    key: formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Column(
                        children: [
                          //Full Name
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                return val.isNotEmpty
                                    ? null
                                    : "Please enter your name";
                              },
                              controller: fullNameController,
                              decoration: inputTextFieldDecoration("Full Name"),
                              style: inputTextFieldStyle()),
                          SizedBox(
                            height: 30,
                          ),

                          //Organization Name
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              return val.isNotEmpty
                                  ? null
                                  : "Please enter an organization name";
                            },
                            controller: orgNameController,
                            decoration:
                                inputTextFieldDecoration("Organization Name"),
                            style: inputTextFieldStyle(),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Employee ID
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                return val.isNotEmpty
                                    ? null
                                    : "Please enter your employee ID number";
                              },
                              controller: empIdController,
                              decoration:
                                  inputTextFieldDecoration("Employee ID No."),
                              style: inputTextFieldStyle()),
                          SizedBox(
                            height: 30,
                          ),

                          //Mobile No
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: mobNoController,
                              validator: (val) {
                                return (val.isNotEmpty &&
                                        RegExp("[0-9]{10,}")
                                            .hasMatch(val.toString()))
                                    ? null
                                    : "Please enter a valid number";
                              },
                              decoration: mobileNumberTextFieldDecoration(),
                              style: inputTextFieldStyle()),
                          SizedBox(
                            height: 30,
                          ),

                          //Email
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailController,
                            validator: (val) {
                              return RegExp(// Escape Character: \
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Please enter a valid email";
                            },
                            decoration: inputTextFieldDecoration("Email"),
                            style: inputTextFieldStyle(),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Password
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            controller: passwordController,
                            validator: (val) {
                              return RegExp("[A-Za-z0-9]{8,}").hasMatch(val)
                                  ? null
                                  : "Password must have at least 8 characters";
                            },
                            decoration: inputTextFieldDecoration("Password"),
                            style: inputTextFieldStyle(),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Confirm Password
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            controller: confirmPasswordController,
                            validator: (val) {
                              String password = passwordController.text;
                              return (val != null && password == val.toString())
                                  ? null
                                  : "Passwords don't match";
                            },
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
                                  uploadFile();
                                },
                                child: Text(
                                  "Choose a File",
                                  style: TextStyle(
                                      fontSize: 16, color: getLogoColor()),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    fileStatus + "  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: getFileTextColor()),
                                  ),
                                  Visibility(
                                    visible: fileStatus == "Image Uploaded",
                                    child: Image.asset(
                                      'images/checked.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45,
                          ),

                          //Next Button
                          ButtonTheme(
                            minWidth: 160,
                            height: 40,
                            child: RaisedButton(
                              onPressed: () {
                                registerUser(context);
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
