import 'package:flutter/material.dart';

class TitleFull extends StatelessWidget {
  final String text;
  final String date;
  final String? hour;

  const TitleFull({
    super.key, required this.text, required this.date, this.hour = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text(date, style: const TextStyle(color: Colors.grey),),
              const Spacer(),
              Text(hour!, style: const TextStyle(color: Colors.grey),),
            ],
          )
        ],
      ),
    );
  }
}