import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
  });

  final Drink drink;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          // color: const Color.fromARGB(1000, 153, 169, 143),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                drink.imagePath,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              drink.name,
              style: TextStyle(
                fontFamily: 'Bold',
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    drink.price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Light',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(232, 176, 194, 165),
                      ),
                      Text(
                        drink.rating,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
