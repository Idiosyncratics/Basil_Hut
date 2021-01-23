import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/widget.dart';

class MenuItemCard extends StatefulWidget {

  String imageName, dishName, category;
  int price,
      count = 0;

  MenuItemCard({this.imageName, this.dishName, this.category, this.price});

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard>{

  void increaseCount(){
    if(widget.count+1>10){
      return;
    }
    setState(() {
      widget.count++;
    });
  }

  void decreaseCount(){
    if(widget.count-1<0){
      return;
    }
    setState(() {
      widget.count--;
    });
  }

  Widget build(BuildContext context) {
      return Container( //white container
        height: 140,
        width: double.infinity,
        padding: EdgeInsets.all(0),
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
            Container(
              width: 140,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dishName,
                    style: userInfoTextStyle(),
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                      color: Color(0xff6F797D),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "₹${widget.price}",
                    style: inputTextFieldStyle(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  alignment: Alignment.centerRight,
                  height: double.infinity,
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
                  // color: Colors.teal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: GestureDetector(
                          onTap: () {
                            increaseCount();
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text(
                          widget.count.toString(),
                          style: inputTextFieldStyle(),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: GestureDetector(
                          onTap: decreaseCount,
                          child: Icon(
                            Icons.remove,
                            size: 30,
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