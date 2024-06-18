import 'package:flutter/material.dart';
import 'package:pizza/Models/pizza.dart';

class Favorite extends ChangeNotifier{
  final List<Pizza> pizzas = [];

  void like(Pizza pizza){
    pizzas.add(pizza);
    notifyListeners();
  }

  void unlike(Pizza pizza){
    pizzas.remove(pizza);
    notifyListeners();
  }

  bool isLiked (Pizza pizza){
    return pizzas.contains(pizza) ? true : false;
  }
  
}