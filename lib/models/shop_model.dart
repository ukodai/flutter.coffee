import "package:flutter/material.dart";

import "coffee_model.dart";

class ShopModel extends ChangeNotifier {
  // Coffee for Sale
  final List<CoffeeModel> _shop = [
    // Black Coffee
    CoffeeModel(
      name: "Long Black",
      price: "4.10",
      image: "assets/coffee-mug.png",
    ),
    // Latte
    CoffeeModel(
      name: "Latte",
      price: "4.50",
      image: "assets/cup.png",
    ),

    // Espresso
    CoffeeModel(
      name: "Espresso",
      price: "3.50",
      image: "assets/tea.png",
    ),

    // Iced Coffee
    CoffeeModel(
      name: "Iced Coffee",
      price: "5.00",
      image: "assets/meal.png",
    ),
  ];

  // User Cart
  final List<CoffeeModel> _cart = [];

  // Get Coffee List
  List<CoffeeModel> get shop => _shop;

  // Get User Cart
  List<CoffeeModel> get cart => _cart;

  // Add Item to Cart
  void addToCart(CoffeeModel coffee) {
    _cart.add(coffee);
    notifyListeners();
  }

  // Remove Item from Cart
  void removeFromCart(CoffeeModel coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}
