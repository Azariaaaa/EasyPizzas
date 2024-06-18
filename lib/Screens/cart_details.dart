import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza/Datas/pizzas.dart';
import 'package:pizza/Datas/pizzas.dart';
import 'package:pizza/Models/pizza.dart';
import 'package:pizza/cart.dart';
import 'package:provider/provider.dart';

import '../Datas/pizzas.dart';

class CartDetails extends StatelessWidget {
  CartDetails({super.key, required this.pizzas, required this.amountOfPizza, required this.totalPrice});
  
  double totalPrice = 0;
  int amountOfPizza = 0;
  List<Pizza> pizzas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(image: AssetImage('lib/Images/pizza.png'), width: 40, height: 40,),
                ),
                title: Text(
                  "${pizzas[index].name} : ${pizzas[index].price?.toStringAsFixed(2)}€",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 72, 52, 2),
                    fontWeight: FontWeight.bold
                  ),
                ),
                tileColor: index % 2 == 0 ? Colors.amber : Colors.amberAccent,
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false).substractPizza(pizzas[index]);
                      }, 
                      icon: const Icon(Icons.remove_shopping_cart),
                      color: const Color.fromARGB(255, 164, 30, 30),
                    ),
                  ],
                ),
              );
            },
          ),
          informationsContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              backToHomeButton(context),
              const SizedBox(width: 10), // Espace de 10 pixels entre les boutons
              buyButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget backToHomeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 182, 67, 17),
        fixedSize: const Size(120, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.exit_to_app,
            color: Color.fromARGB(255, 232, 230, 230),
          ),
          Row(
            children: [
              Text(
                "Retour",
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 230, 230),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 182, 67, 17),
        fixedSize: const Size(120, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.euro,
            color: Color.fromARGB(255, 232, 230, 230),
          ),
          Row(
            children: [
              Text(
                "Payer",
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 230, 230),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget informationsContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: const Color.fromARGB(255, 176, 45, 5),
      height: 50,
      child: Row(
        children: [
          const Text(
            "Total à payer: ",
            style: TextStyle(
              color: Color.fromARGB(255, 232, 230, 230),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "$totalPrice€",
            style: const TextStyle(
              color: Color.fromARGB(255, 232, 230, 230),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}