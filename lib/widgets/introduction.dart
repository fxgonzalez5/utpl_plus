import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  final String text;

  const Introduction(this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(10)
      ),

      child: Text(text,style: TextStyle(fontSize: 15, color: Colors.blueGrey.shade700, fontWeight: FontWeight.w500,)),
    );
  }
}