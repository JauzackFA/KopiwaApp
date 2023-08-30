import 'package:flutter/material.dart';
import 'package:kopiwa/component/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 153, 169, 143),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 600,
            ),
            MyButton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/listmenu');
              },
            ),
          ],
        ),
      ),
    );
  }
}
