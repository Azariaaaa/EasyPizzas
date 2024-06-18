import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza/Models/pizza.dart';

class PizzaDetails extends StatelessWidget {
  const PizzaDetails({super.key, required this.pizza});
  
  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        displayPizzaInformations(),
        ElevatedButton(
          onPressed: () => {
            context.go('/')
          }, 
          child: const Text('Retour')
        )
      ],
    );
  }

  Widget displayPizzaInformations(){
    return Column(
      children: [
        Text(pizza.name.toString()),
        Text(pizza.ingredients.toString()),
        Text(pizza.price.toString()),
        Text(pizza.id.toString()),
      ],
    );
  }

}