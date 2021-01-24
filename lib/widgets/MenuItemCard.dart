import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';
import 'package:basil_hut/widgets/global.dart' as globals;

class MenuItemCard extends StatefulWidget {
  String imageName, dishName, category;
  int price;

  MenuItemCard({this.imageName, this.dishName, this.category, this.price});

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int count = 0;
  double totalCostOfDish = 0.0;

  void increaseCount() {
    if (count + 1 > 10) {
      return;
    }
    setState(() {
      count += 1;
      totalCostOfDish += widget.price;
      print("working add" + count.toString());
    });
    if (globals.hashMap.containsKey(widget.dishName)) {
      globals.Pair currPair = globals.hashMap[widget.dishName];
      currPair.quantity += 1;
      currPair.total += widget.price;
    } else {
      globals.Pair currPair = globals.Pair();
      currPair.quantity = 1;
      currPair.total = widget.price + 0.0;
      globals.hashMap[widget.dishName] = currPair;
    }
    globals.hashMap.forEach((key, value) {
      print(key +
          " : " +
          value.quantity.toString() +
          " : " +
          value.total.toString());
    });
    globals.increment(widget.price);
  }

  void decreaseCount() {
    if (count - 1 < 0) {
      return;
    }
    setState(() {
      count -= 1;
      totalCostOfDish -= widget.price;
      print("working sub" + count.toString());
    });
    if (globals.hashMap.containsKey(widget.dishName)) {
      globals.Pair currPair = globals.hashMap[widget.dishName];
      currPair.quantity -= 1;
      currPair.total -= widget.price;
      if (currPair.quantity == 0) {
        currPair.total = 0;
        globals.hashMap.remove(widget.dishName);
      }
    }
    globals.hashMap.forEach((key, value) {
      print(key +
          " : " +
          value.quantity.toString() +
          " : " +
          value.total.toString());
    });
    globals.decrement(widget.price);
  }

  Widget build(BuildContext context) {
    String topLine = "";
    String bottomLine = "";
    List allWords = widget.dishName.split(' ');
    int currentCharCount = 0;
    for (int i = 0; i < allWords.length; i++) {
      String curr = allWords[i];
      currentCharCount += curr.length + 1;
      if (currentCharCount < 15) {
        topLine += curr + " ";
      } else {
        bottomLine += curr + " ";
      }
    }

    //Correct Later
    if (globals.hashMap.containsKey(widget.dishName)) {
      count = globals.hashMap[widget.dishName].quantity;
    } else {
      count = 0;
    }

    return Container(
      //white container
      height: 140,
      width: double.infinity,
      padding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 15),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.all(0),
            height: double.infinity,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                'Food/${widget.category}/${widget.imageName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      topLine + "\n" + bottomLine,
                      style: userInfoTextStyle(),
                    ),
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                      color: Color(0xff6F797D),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "₹ ${widget.price}",
                    style: inputTextFieldStyle(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                alignment: Alignment.centerRight,
                height: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 10,),
                // color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: GestureDetector(
                        onTap: () {
                          increaseCount();
                        },
                        child: Icon(
                          Icons.add,
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Text(
                          count.toString(),
                          style: inputTextFieldStyle(),
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: GestureDetector(
                        onTap: () {
                          decreaseCount();
                        },
                        child: Icon(
                          Icons.remove,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
