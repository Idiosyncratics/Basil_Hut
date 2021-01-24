import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

InputDecoration inputTextFieldDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
        color: Color(0xff264653), fontSize: 18, fontFamily: "Poppins"),
    focusedBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: Color(0xff264653), style: BorderStyle.solid),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff264653)),
    ),
  );
}

TextStyle inputTextFieldStyle() {
  return TextStyle(
      color: Color(0xff264653),
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w200);
}

TextStyle pageHeadingTextFieldStyle() {
  return TextStyle(
      fontFamily: "Poppins",
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: Color(0xff153745));
}

TextStyle userInfoTextStyle() {
  return TextStyle(
      color: Color(0xff264653),
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins");
}

TextStyle buttonTextStyle() {
  return TextStyle(
      fontSize: 20,
      color: Color(0xffd8f3dc),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700);
}

InputDecoration mobileNumberTextFieldDecoration() {
  return InputDecoration(
    isDense: true,
    prefixIcon: Text(
      "+91 | ",
      style: inputTextFieldStyle(),
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
    hintText: "Mobile Number",
    hintStyle: TextStyle(color: Color(0xff264653), fontSize: 19),
    focusedBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: Color(0xff264653), style: BorderStyle.solid),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff264653)),
    ),
  );
}

Color getLogoColor() {
  return Color(0xff264653);
}

BoxDecoration getGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        //Sunkist
        Color(0xffF2994A),
        Color(0xffF2C94C),
      ],
    ),
  );
}

Text makePreviewField(String field) {
  return Text(
    field,
    style: inputTextFieldStyle(),
  );
}

Text makePreviewValue(String value) {
  return Text(
    "   :   " + value,
    style: userInfoTextStyle(),
  );
}

Container showLoadingScreen() {
  return Container(
    decoration: getGradient(),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: CircularProgressIndicator())],
        ),
      ),
    ),
  );
}
