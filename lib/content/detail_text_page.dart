// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailTextPage extends StatelessWidget {
  final String detailText;
  final String titleText;

  const DetailTextPage({
    Key? key,
    required this.titleText,
    required this.detailText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontFamily: 'Bold',
              fontSize: 25, // Increase font size for the title
            ),
          ),
          const SizedBox(
              height: 10), // Add some spacing between title and detail
          Text(
            detailText,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontFamily: 'Light',
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
