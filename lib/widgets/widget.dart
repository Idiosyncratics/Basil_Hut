import 'package:flutter/material.dart';

InputDecoration inputTextFieldDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
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

TextStyle inputTextFieldStyle() {
  return TextStyle(color: Color(0xff264653), fontSize: 19);
}

Color getLogoColor(){
  return Color(0xff264653);
}

BoxDecoration getGradient(){
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffF2994A),
        Color(0xffF2C94C),
      ],
    ),
  );
}
