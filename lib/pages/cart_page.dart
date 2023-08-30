import 'package:flutter/material.dart';
import 'package:kopiwa/component/button.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Drink drink, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '                          My Cart',
            style: TextStyle(
              color: Color.fromARGB(1000, 153, 169, 143),
              fontFamily: 'Bold',
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(1000, 153, 169, 143),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Drink drink = value.cart[index];
                  final String drinkName = drink.name;
                  final String drinkPrice = drink.price;

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: ListTile(
                      title: Text(
                        drinkName,
                        style: TextStyle(
                          fontFamily: 'Bold',
                          color: Colors.grey.shade800,
                        ),
                      ),
                      subtitle: Text(
                        drinkPrice,
                        style: const TextStyle(
                          fontFamily: 'Light',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(1000, 153, 169, 143),
                        ),
                        onPressed: () => removeFromCart(drink, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(
                text: 'Pay Now',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
