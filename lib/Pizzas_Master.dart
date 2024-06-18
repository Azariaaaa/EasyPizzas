import 'package:flutter/material.dart';
import 'package:pizza/Datas/pizzas.dart' as pizzas;
import 'package:go_router/go_router.dart';
import 'package:pizza/Screens/cart_details.dart';
import 'package:pizza/cart.dart';
import 'package:pizza/favorite.dart';
import 'package:provider/provider.dart';

class Pizzas_Master extends StatelessWidget {
  const Pizzas_Master({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Easy Pizzas',
            style: TextStyle(
              color:  Color.fromARGB(255, 164, 30, 30),
              fontWeight: FontWeight.bold,
              ),
            ),
          )
      ),
      body: Material(
        child: Column(
          children: [
            const Image(image: AssetImage('lib/Images/easypizzas-logo.png'), width: 200, height: 200,),
            cartButton(),
            Expanded(
              child: Consumer<Favorite>(
                builder: (context, favoriteList, child) => 
                ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: pizzas.pizzas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(image: AssetImage('lib/Images/pizza.png'), width: 40, height: 40,),
                      ),
                      title: Text(
                        "${pizzas.pizzas[index].name} : ${pizzas.pizzas[index].price?.toStringAsFixed(2)}€",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 72, 52, 2),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      tileColor: index % 2 == 0
                          ? Colors.amber
                          : Colors.amberAccent,
                      onTap: () {
                        context.go('/details', extra: pizzas.pizzas[index]);
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false).addPizza(pizzas.pizzas[index]);
                            }, 
                            icon: const Icon(Icons.shopping_cart),
                            color: const Color.fromARGB(255, 164, 30, 30),
                          ),
                          IconButton(
                            iconSize: 25,
                            icon: Icon(
                              Icons.favorite,
                              color: favoriteList.pizzas.contains(pizzas.pizzas[index])
                                  ? Colors.red
                                  : Colors.white70,
                            ),
                            onPressed: () {
                              if (favoriteList.pizzas.contains(pizzas.pizzas[index])) {
                                favoriteList.unlike(pizzas.pizzas[index]);
                              } else {
                                favoriteList.like(pizzas.pizzas[index]);
                              }
                            },
                          ),
                        ]
                      )
                    );
                  },
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget cartButton() {
    return Consumer<Cart>(
      builder: (context, cart, child) => Row(
        children: [
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 8.0, top: 50.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/cart', extra: CartDetails(pizzas: cart.pizzas, amountOfPizza: cart.amountOfPizza, totalPrice: cart.totalPrice));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 182, 67, 17),
                minimumSize: const Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 232, 230, 230),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Payer : ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 232, 230, 230),
                        ),
                      ),
                      Text(
                        "${cart.totalPrice}€",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 232, 230, 230),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}