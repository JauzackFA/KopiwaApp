import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            // color: Color.fromARGB(1000, 255, 248, 222),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(1000, 153, 169, 143),
                // color: Colors.black,
                fontFamily: 'Bold',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
