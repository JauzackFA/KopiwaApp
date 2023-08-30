import 'package:flutter/material.dart';

import 'drink.dart';

class Shop extends ChangeNotifier {
  final List<Drink> drinkMenu = [
    Drink(
      name: "Matcha Latte",
      price: "25.000",
      imagePath: 'lib/assets/matcha-latte.jpg',
      rating: "4.9",
    ),
    Drink(
      name: "Americano",
      price: "20.000",
      imagePath: 'lib/assets/americano.jpg',
      rating: "5",
    ),
    Drink(
      name: "Ice Cappuccino",
      price: "30.000",
      imagePath: 'lib/assets/ice-cappuccino.jpg',
      rating: "4.7",
    ),
    Drink(
      name: "Hazelnut Latte",
      price: "35.000",
      imagePath: 'lib/assets/hazelnut-latte.png',
      rating: "4.9",
    ),
  ];

  List<Drink> _cart = [];
  List<Drink> get getDrinkMenu => drinkMenu;
  List<Drink> get cart => _cart;

  void addToCart(Drink getDrinkMenu, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(getDrinkMenu);
    }
    notifyListeners();
  }

  void removeFromCart(Drink drink) {
    _cart.remove(drink);
    notifyListeners();
  }
}
