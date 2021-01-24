import 'package:flutter/material.dart';
import 'package:basil_hut/widgets/MenuItemCard.dart';

class MenuList {
  //Returns all the menu items for the given category
  Column getMenuCards(String menuCategory, BuildContext context) {
    switch (menuCategory) {
      case "Soups":
        {
          return Column(
            children: [
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Coconut Mushroom soup.jpg",
                  dishName: "Coconut Mushroom Soup",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "tomato soup.jpg",
                  dishName: "Tomato Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Creamy broccoli soup.jpg",
                  dishName: "Creamy Broccoli Soup",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Cucumber spinach soup.jpg",
                  dishName: "Cucumber Spinach Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Fried Tofu soup.jpg",
                  dishName: "Fried Tofu Soup",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "lemon basil soup.jpg",
                  dishName: "Lemon Basil Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "lemon coriander soup.jpg",
                  dishName: "Lemon Coriander Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "manchow soup.jpg",
                  dishName: "Manchow Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Roasted Pumpkin soup.jpg",
                  dishName: "Roasted Pumpkin Soup",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Squash Tofu soup.jpg",
                  dishName: "Squash Tofu Soup",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "sweet corn soup.jpg",
                  dishName: "Sweet Corn Soup",
                  price: 170,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "thyme Mushroom soup.jpg",
                  dishName: "Thyme Mushroom Soup",
                  price: 150,
                  category: menuCategory),
              getBottomSizedBox(context),
            ],
          );
        }
      case "Desserts":
        {
          return Column(
            children: [
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Apple pie.jpg",
                  dishName: "Apple Pie",
                  price: 220,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "BullsEye.jpg",
                  dishName: "Bulls Eye",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Choco Spark puddle.jpg",
                  dishName: "Choco Spark Puddle",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Dark Choco Sandwich.jpg",
                  dishName: "Dark Choco Sandwich",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Dutch truffle.jpg",
                  dishName: "Dutch Truffle",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Gulab Jamun.jpg",
                  dishName: "Gulab Jamun",
                  price: 300,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Hot Choco Mousse.jpg",
                  dishName: "Hot Choco Mousse",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "KitKat Crunch.jpg",
                  dishName: "KitKat Crunch",
                  price: 180,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Lemon Tart.jpg",
                  dishName: "Lemon Tart",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Red Velvet Cup Cake.jpg",
                  dishName: "Red Velvet Cupcake",
                  price: 180,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "tiramisu.jpg",
                  dishName: "Tiramisu",
                  price: 180,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Waffles.jpg",
                  dishName: "Waffles",
                  price: 220,
                  category: menuCategory),
              getBottomSizedBox(context),
            ],
          );
        }

      case "Appetizers":
        {
          return Column(children: [
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "bruschetta.jpg",
                dishName: "Bruschetta",
                price: 220,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Caesar salad.jpg",
                dishName: "Caesar Salad",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "chilli garlic cottage cheese.jpg",
                dishName: "Chilli Garlic Cottage Cheese",
                price: 270,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Corn Salt 'N' Pepper.jpg",
                dishName: "Corn Salt 'N' Pepper",
                price: 230,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Cream Potato Asparagus Salad.jpg",
                dishName: "Cream Potato Asparagus Salad",
                price: 300,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "GourmetSalad.jpg",
                dishName: "Gourmet Salad",
                price: 300,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "greek salad.jpg",
                dishName: "Greek Salad",
                price: 210,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "herbed cheese shashlik.jpg",
                dishName: "Herbed Cheese Shashlik",
                price: 220,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "honey chilli potato.jpg",
                dishName: "Honey Chilli Potato",
                price: 230,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "International Dabeli.jpg",
                dishName: "International Dabeli",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "labneh lemon bar.jpg",
                dishName: "Labneh Lemon Bar",
                price: 300,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Maska bun.jpg",
                dishName: "Maska Bun",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Mushroomkekabab.jpg",
                dishName: "Mushroom Ke Kabab",
                price: 400,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "paneer tikka.jpg",
                dishName: "Paneer Tikka",
                price: 330,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "spring roll.jpg",
                dishName: "Spring Roll",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "vada-pav.jpg",
                dishName: "Vada Pav",
                price: 250,
                category: menuCategory),
            getBottomSizedBox(context),
          ]);
        }

      case "Drinks":
        {
          return Column(
            children: [
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Cafe Latte.jpg",
                  dishName: "Cafe Latte",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Caramel Hazelnut.jpg",
                  dishName: "Caramel Hazelnut",
                  price: 280,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Dragon Smoothie.jpg",
                  dishName: "Dragon Smoothie",
                  price: 250,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "khmer Martini.jpg",
                  dishName: "Khmer Martini",
                  price: 350,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Mixed smoothie.jpg",
                  dishName: "Mixed Smoothie",
                  price: 250,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Mochaccino.jpg",
                  dishName: "Mochaccino",
                  price: 220,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Monkey Tail.jpg",
                  dishName: "Monkey Tail",
                  price: 300,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Orange juice.jpg",
                  dishName: "Orange Juice",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Passion Smoothie.jpg",
                  dishName: "Passion Smoothie",
                  price: 250,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Raspberry sparkling tea.jpg",
                  dishName: "Raspberry Tea",
                  price: 250,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Shirley Temple.jpg",
                  dishName: "Shirley Temple",
                  price: 300,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Vanilla Frappe.jpg",
                  dishName: "Vanilla Frappe",
                  price: 250,
                  category: menuCategory),
              getBottomSizedBox(context),
            ],
          );
        }

      case "Fast Food":
        {
          return Column(
            children: [
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Burger.jpg",
                  dishName: "Burger",
                  price: 180,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Diet Coke.jpg",
                  dishName: "Diet Coke",
                  price: 180,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Donuts.jpg",
                  dishName: "Donuts",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "French Fries.jpg",
                  dishName: "French Fries",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "ice cream.jpg",
                  dishName: "Ice Cream",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Pizza.jpg",
                  dishName: "Pizza",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "popcorn.jpg",
                  dishName: "Popcorn",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Raj Kachori.jpg",
                  dishName: "Raj Kachori",
                  price: 200,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Samosa.jpg",
                  dishName: "Samosa",
                  price: 100,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Taco.jpg",
                  dishName: "Taco",
                  price: 150,
                  category: menuCategory),
              SizedBox(height: 10),
              MenuItemCard(
                  imageName: "Veg hot dog.jpg",
                  dishName: "Veg Hot Dog",
                  price: 180,
                  category: menuCategory),
              getBottomSizedBox(context),
            ],
          );
        }

      case "Meals":
        {
          return Column(children: [
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Butter naan.jpg",
                dishName: "Butter Naan",
                price: 150,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Chapati.jpg",
                dishName: "Chapati",
                price: 120,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Dal Bati Churma.jpg",
                dishName: "Dal Bati Churma",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Dal Makhni.jpg",
                dishName: "Dal Makhni",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Garlic naan.jpg",
                dishName: "Garlic Naan",
                price: 150,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Indian Thali.jpg",
                dishName: "Indian Thali",
                price: 350,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "kaju kofta Curry.jpg",
                dishName: "kaju kofta Curry",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Lasagne of roasted chasseur.jpg",
                dishName: "Lasagne of roasted chasseur",
                price: 370,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Lemon Rice.jpg",
                dishName: "Lemon Rice",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Masala Dosa.jpg",
                dishName: "Masala Dosa",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Miv Veg.jpg",
                dishName: "Miv Veg",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Mix Pulao.jpg",
                dishName: "Mix Pulao",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Paneer biryani.jpg",
                dishName: "Paneer biryani",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Pasta Bowl.jpg",
                dishName: "Pasta Bowl",
                price: 250,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "Plain rice.jpg",
                dishName: "Plain Rice",
                price: 180,
                category: menuCategory),
            SizedBox(height: 10),
            MenuItemCard(
                imageName: "tomato & Basil.jpg",
                dishName: "Tomato & Basil",
                price: 250,
                category: menuCategory),
            getBottomSizedBox(context)
          ]);
        }
    }
  }

  SizedBox getBottomSizedBox(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height - 630);
  }
}
