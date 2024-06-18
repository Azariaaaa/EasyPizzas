import 'package:pizza/Models/pizza.dart';
import 'package:pizza/category.dart';

final List<Pizza> pizzas = [
  Pizza(name: "Margherita", price: 6, ingredients: ["Tomato", "Mozzarella", "Basil"], category: Categorie.bianca),
  Pizza(name: "Quattro Stagioni", price: 12, ingredients: ["Tomato", "Mozzarella", "Mushrooms", "Ham", "Artichokes", "Olives"], category: Categorie.bianca),
  Pizza(name: "Capricciosa", price: 11, ingredients: ["Tomato", "Mozzarella", "Mushrooms", "Ham", "Artichokes"], category: Categorie.veggie),
  Pizza(name: "Marinara", price: 5, ingredients: ["Tomato", "Garlic", "Oregano"], category: Categorie.rossa),
  Pizza(name: "Regina", price: 10, ingredients: ["Tomato", "Mozzarella", "Ham", "Mushrooms"], category: Categorie.bianca),
  Pizza(name: "Diavola", price: 10, ingredients: ["Tomato", "Mozzarella", "Spicy Salami"], category: Categorie.veggie),
  Pizza(name: "Quattro Formaggi", price: 12, ingredients: ["Mozzarella", "Gorgonzola", "Parmesan", "Fontina"], category: Categorie.bianca),
  Pizza(name: "Parma", price: 13, ingredients: ["Tomato", "Mozzarella", "Parma Ham", "Arugula"], category: Categorie.rossa),
  Pizza(name: "Bianca", price: 10, ingredients: ["Mozzarella", "Ricotta", "Garlic", "Rosemary"], category: Categorie.bianca),
  Pizza(name: "Ortolana", price: 6, ingredients: ["Tomato", "Mozzarella", "Grilled Vegetables"], category: Categorie.rossa),
];


