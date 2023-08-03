import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;

  const CategoryCard({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue[900],
        borderRadius: BorderRadius.circular(5)
      ),

      child: Stack(
        children: [
          Text(text, style: const TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}