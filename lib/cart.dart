import 'package:flutter/material.dart';
import 'package:pizza/Models/pizza.dart';

class Cart extends ChangeNotifier {
  double totalPrice = 0;
  int amountOfPizza = 0;
  final List<Pizza> pizzas = [];

  void addPizza(Pizza pizza) {
    totalPrice += pizza.price!;
    amountOfPizza++;
    pizzas.add(pizza);
    notifyListeners();
  }

  void substractPizza(Pizza pizza) {
    totalPrice -= pizza.price!;
    amountOfPizza--;
    pizzas.remove(pizza);
    notifyListeners();
  }
}