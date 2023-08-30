import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kopiwa/component/drink_tile.dart';
import 'package:kopiwa/models/drink.dart';
import 'package:kopiwa/models/shop.dart';
import 'package:provider/provider.dart';

import '../content/detail_drink_page.dart';
import '../content/detail_slide_page.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({super.key});

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  List imageList = [
    {
      "id": 1,
      "image_path": "lib/assets/promo-diary1.jpg",
      "detailText": "Detail for Image 1"
    },
    {
      "id": 2,
      "image_path": "lib/assets/puasa.jpg",
      "detailText": "Detail for Image 2"
    }
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  // List drinkMenu = [
  //   Drink(
  //     name: "Matcha Latte",
  //     price: "25.000",
  //     imagePath: 'lib/assets/matcha-latte.jpg',
  //     rating: "4.9",
  //   ),
  //   Drink(
  //     name: "Americano",
  //     price: "20.000",
  //     imagePath: 'lib/assets/americano.jpg',
  //     rating: "5",
  //   ),
  //   Drink(
  //     name: "Ice Cappuccino",
  //     price: "30.000",
  //     imagePath: 'lib/assets/ice-cappuccino.jpg',
  //     rating: "4.7",
  //   ),
  //   Drink(
  //     name: "Hazelnut Latte",
  //     price: "Rp. 35.000",
  //     imagePath: 'lib/assets/hazelnut-latte.png',
  //     rating: "4.9",
  //   ),
  // ];

  void navigateToDrinkDetail(int index) {
    final shop = context.read<Shop>();
    final drinkMenu = shop.getDrinkMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetailPage(
          drink: drinkMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final drinkMenu = shop.getDrinkMenu;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(1000, 249, 251, 231),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '                    K O P I W A',
          style: TextStyle(
            color: Color.fromARGB(1000, 153, 169, 143),
            fontFamily: 'Bold',
          ),
        ),
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(1000, 153, 169, 143),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(23),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(1000, 153, 169, 143),
          onPressed: () {
            Navigator.pushNamed(context, '/cartpage');
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Mengatur posisi FAB

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              CarouselSlider(
                items: imageList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  imagePath: item['image_path'],
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    print(entry);
                    print(entry.key);
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentIndex == entry.key
                              ? Colors.grey.shade200
                              : const Color.fromARGB(1000, 153, 169, 143),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(1000, 153, 169, 143),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade700,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Light',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(1000, 153, 169, 143),
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Drink Menu",
              style: TextStyle(
                fontFamily: 'Bold',
                color: Colors.grey.shade800,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drinkMenu.length,
              itemBuilder: (context, index) => DrinkTile(
                drink: drinkMenu[index],
                onTap: () => navigateToDrinkDetail(index),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 25,
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'lib/assets/americano.jpg',
                    height: 60,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Americano',
                      style: TextStyle(
                        fontFamily: 'Bold',
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '20.000',
                      style: TextStyle(
                        fontFamily: 'Light',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // const Spacer(),
                // Icon(
                //   Icons.favorite_outline,
                //   color: Colors.grey.shade600,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
