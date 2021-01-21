import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';

class SuccessScreen extends StatelessWidget {
  String regID;
  SuccessScreen(this.regID);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradient(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                // Basil Hut Logo
                Container(
                  height: 300,
                  width: 400,
                  child: Image.asset('images/BasilHutIcon.png'),
                ),

                // Registration Details Card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.only(bottom: 70),
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/checked.png',
                        width: 60,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Registration Successful",
                        style: userInfoTextStyle(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Your Registration ID is: ",
                        style: inputTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        regID,
                        style: userInfoTextStyle(),
                      )
                    ],
                  ),
                ),
                ButtonTheme(
                  minWidth: 160,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Let's Go!",
                      style: TextStyle(fontSize: 20, color: Color(0xffd8f3dc)),
                    ),
                    color: getLogoColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
