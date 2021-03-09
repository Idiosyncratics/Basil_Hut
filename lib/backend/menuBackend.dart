import 'package:basil_hut/widgets/MenuItemCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/global.dart' as globals;

int checkInt(var val) {
  if (!(val is int)) {
    val = int.parse(val);
  }
  return val;
}

Future<List> getMenuItemsFromFB(String menuCategory) async {
  List<Widget> list = List();

  await FirebaseFirestore.instance
      .collection(menuCategory)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              list.add(SizedBox(
                height: 10,
              ));
              list.add(MenuItemCard(
                dishName: doc.id.toString(),
                imageName: doc.data()['URL'],
                price: checkInt(doc.data()['Cost']),
                category: menuCategory,
              ));
            })
          });

  list.add(SizedBox(height: 90));
  return list;
}

Future<void> saveCart() async {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  User user = FirebaseAuth.instance.currentUser;
  await usersCollection
      .doc(user.email)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    if (documentSnapshot.exists) {
      List<Map> cart = List();
      globals.hashMap.forEach((key, value) {
        Map<String, List> map = Map();
        map[key] = [value.quantity, value.total];
        cart.add(map);
      });
      await usersCollection.doc(user.email).update({'Cart': cart});
    }
  });
}

Future<void> fetchCartFromFB() {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  User user = FirebaseAuth.instance.currentUser;
  try {
    usersCollection
        .doc(user.email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        List fbCart = documentSnapshot.get('Cart');
        int count = 0;
        double total = 0.0;
        for (int i = 0; i < fbCart.length; i++) {
          Map map = fbCart[i];
          map.forEach((key, value) {
            globals.Pair pair = globals.Pair();
            pair.quantity = value[0];
            count += value[0];
            pair.total = value[1];
            total += value[1];
            globals.hashMap[key] = pair;
          });
        }
        globals.itemCount = count;
        globals.totalCost = total;
      }
    });
  }catch(exception){
    print("Empty cart OR something else went wrong");
  }
}
