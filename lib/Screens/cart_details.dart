import 'package:flutter/material.dart';
import 'package:pizza/Models/pizza.dart';

class CartDetails extends StatelessWidget {
  CartDetails({super.key, required this.pizzas, required this.amountOfPizza, required this.totalPrice});
  
  double totalPrice = 0;
  int amountOfPizza = 0;
  List<Pizza> pizzas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
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
                tileColor: index % 2 == 0
                    ? Colors.amber
                    : Colors.amberAccent,
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.shopping_cart),
                      color: const Color.fromARGB(255, 164, 30, 30),
                    ),
                    IconButton(
                      iconSize: 25,
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      onPressed: () {},
                    ),
                  ]
                )
              );
            },
          ),
          backToHomeButton(),
        ],
      ) 
    );
  }
  Widget backToHomeButton(){
    return ElevatedButton(
      onPressed: () {
        print("backHome");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 182, 67, 17),
        minimumSize: const Size(120, 50),
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
                "Retour.",
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
}