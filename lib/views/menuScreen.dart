import 'dart:collection';
import 'dart:ffi';

import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/backend/bhUser.dart';
import 'package:basil_hut/main.dart';
import 'package:basil_hut/widgets/MenuList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/widgets/MenuItemCard.dart';
import 'package:basil_hut/views/homeScreen.dart';
import 'package:basil_hut/backend/firestore.dart';
import 'package:basil_hut/backend/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:basil_hut/widgets/global.dart' as globals;
import 'package:basil_hut/views/paymentScreen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();

  MenuScreen() {
    globals.totalCost = 0.0;
    globals.itemCount = 0;
    globals.hashMap = new HashMap();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  String menuCategory = "Appetizers";
  MenuList menuList = MenuList();
  Image arrow = Image.asset('images/arrowsUp.png');

  _MenuScreenState() {
    globals.increment = increment;
    globals.decrement = decrement;
  }

  void increment(int price) {
    setState(() {
      globals.itemCount++;
      globals.totalCost += price;
    });
  }

  void decrement(int price) {
    setState(() {
      globals.itemCount--;
      globals.totalCost -= price;
    });
  }

  Future<void> _userSignOutButton() async {
    AuthMethods authMethods = new AuthMethods();
    FirestoreMethods firestoreMethods = new FirestoreMethods();
    String email = firestoreMethods.getBHUserDetails();
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Center(
            child: Text('You are signed in:', style: userInfoTextStyle())),
        content: Column(
          children: [
            Text('Email: ' + email, style: inputTextFieldStyle()),
            Text('Sign Out?', style: userInfoTextStyle())
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              authMethods.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    );
  }

  ButtonTheme getMenuTextTabButton(String category) {
    return ButtonTheme(
      child: TextButton(
        onPressed: () {
          setState(() {
            menuCategory = category;
          });
        },
        child: Text(
          category,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontFamily: "Poppins"),
        ),
      ),
    );
  }

  List<Row> getCart() {
    List<Row> list = List();
    globals.hashMap.forEach((key, value) {
      list.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width-150,
              child: Text(
            key + " x " + value.quantity.toString(),
            style: inputTextFieldStyle(),
          )),
          Text("₹ " + value.total.toString(), style: inputTextFieldStyle())
        ],
      ));
    });
    if (list == null) {
      list.add(Row(children: [Text("No Items")]));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SlidingUpPanel(
        onPanelClosed: () {
          setState(() {
            arrow = Image.asset('images/arrowsUp.png');
          });
        },
        onPanelOpened: () {
          setState(() {
            arrow = Image.asset('images/arrowsDown.png');
          });
        },
        color: Colors.grey[100],
        minHeight: MediaQuery.of(context).size.height - 650,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        panel: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: arrow,
                width: 22,
                padding: EdgeInsets.only(bottom: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text("Qty: ",
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontSize: 22,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w200)),
                      Text(globals.itemCount.toString(),
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontSize: 22,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total: ",
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontSize: 22,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w200)),
                      Text("₹ " + globals.totalCost.toString(),
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontSize: 22,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Cart',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: getLogoColor()),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Order Summary",
                style: TextStyle(
                    color: Color(0xff264653), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height-490,
                  child: SingleChildScrollView(
                    child: Column(
                      children: getCart(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                minWidth: 160,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentScreen(globals.totalCost.toInt())));
                  },
                  child: Text(
                    "Confirm",
                    style:
                    buttonTextStyle(),
                  ),
                  color: Color(0xff264653),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              // Menu Categories - Body Container
              Container(
                padding: EdgeInsets.all(0),
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/menuImage.png')),
                ),
                child: SafeArea(
                  child: Container(
                    //Top Container
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/back.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Menu',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                _userSignOutButton();
                              },
                              child: Image.asset(
                                'images/user.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("<  ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Poppins")),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    getMenuTextTabButton("Appetizers"),
                                    getMenuTextTabButton("Desserts"),
                                    getMenuTextTabButton("Drinks"),
                                    getMenuTextTabButton("Fast Food"),
                                    getMenuTextTabButton("Meals"),
                                    getMenuTextTabButton("Soups"),
                                  ],
                                ),
                              ),
                            ),
                            Text("  >",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Poppins"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Menu Items
              Container(
                decoration: getGradient(),
                height: MediaQuery.of(context).size.height - 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: menuList.getMenuCards(menuCategory, context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
