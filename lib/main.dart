import 'package:flutter/material.dart';
import 'package:kopiwa/models/shop.dart';
import 'package:kopiwa/pages/cart_page.dart';
import 'package:kopiwa/pages/landing_page.dart';
import 'package:kopiwa/pages/list_menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      routes: {
        '/landingpage': (context) => const LandingPage(),
        '/listmenu': (context) => const ListMenu(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
