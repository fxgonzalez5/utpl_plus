import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SectionHeader({
    super.key, required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          GestureDetector(
            onTap: onPressed,
            
            child: Row(
              children: [
                Text('Ver más', style: TextStyle(color: Colors.grey.shade700),),
                const SizedBox(width: 5,),
                Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.grey.shade700,)
              ],
            )
          )
        ],
      ),
    );
  }
}