import 'package:flutter/material.dart';
import 'package:pizza/Models/pizza.dart';
import 'package:pizza/Pizzas_Master.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza/Screens/cart_details.dart';
import 'package:pizza/Screens/pizza_details.dart';
import 'package:pizza/cart.dart';
import 'package:pizza/favorite.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Favorite()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: const MyApp(),
    )
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Pizzas_Master(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final pizza = state.extra as Pizza;
        return PizzaDetails(pizza: pizza);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state){
        final cart = state.extra as CartDetails;
        // final pizzas = state.extra as List<Pizza>;
        // final amountOfPizza = state.extra as int;
        // final totalPrice = state.extra as double;
        return CartDetails(pizzas: cart.pizzas, amountOfPizza: cart.amountOfPizza, totalPrice: cart.totalPrice,);
      }
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}