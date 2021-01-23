import 'package:basil_hut/backend/auth.dart';
import 'package:basil_hut/backend/bhUser.dart';
import 'package:basil_hut/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/widgets/MenuItemCard.dart';
import 'package:basil_hut/views/homeScreen.dart';
import 'package:basil_hut/backend/firestore.dart';
import 'package:basil_hut/backend/auth.dart';

class MenuScreen extends StatefulWidget {


  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  String menuCategory = "Soup";

  Future<void> _userSignOutButton() async {
    AuthMethods authMethods = new AuthMethods();
    FirestoreMethods firestoreMethods=new FirestoreMethods();
    String email = firestoreMethods.getBHUserDetails();
      await showDialog(
          context: context,
          builder: (context) => new AlertDialog(

        title: Center(child: Text('You are signed in:', style: userInfoTextStyle())),
        content: Column(
          children: [
            Text('Email: '+email, style: inputTextFieldStyle()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Menu Categories
          Container( //teal container
            padding: EdgeInsets.all(0),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'MealsMealsMealsMealsMealsMealsMealsMealsMealsMealsMeals',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Menu Items
          Container(
            decoration: getGradient(),
            height: MediaQuery.of(context).size.height-180,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(child: getMenuCards()),
          )
        ],
      ),
    );
  }

  Column getMenuCards() {
    switch (menuCategory) {
      case "Soup" :
        {
          return Column(
            children: [
              SizedBox(height: 10),
              MenuItemCard(imageName: "Coconut Mushroom soup.jpg",
                  dishName: "Coconut Mushroom",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "tomato soup.jpg",
                  dishName: "Tomato Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "Creamy broccoli soup.jpg",
                  dishName: "Creamy Broccoli Soup",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "Cucumber spinach soup.jpg",
                  dishName: "Cucumber Spinach Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "Fried Tofu soup.jpg",
                  dishName: "Fried Tofu Soup",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "lemon basil soup.jpg",
                  dishName: "Lemon Basil Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "lemon coriander soup.jpg",
                  dishName: "Lemon Coriander",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "manchow soup.jpg",
                  dishName: "Manchow Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "Roasted Pumpkin soup.jpg",
                  dishName: "Roasted Pumpkin Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "Squash Tofu soup.jpg",
                  dishName: "Squash Tofu Soup",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "sweet corn soup.jpg",
                  dishName: "Sweet Corn Soup",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(imageName: "thyme Mushroom soup.jpg",
                  dishName: "Thyme Mushroom",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
            ],
          );
          break;
        } //case 1 ends
    }
  }
}
