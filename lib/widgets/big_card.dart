import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  const BigCard({
    super.key, required this.image, required this.title, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover
          ),
        ),
    
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 95,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 18
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
    
                const SizedBox(height: 5,),
    
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.grey.shade500.withOpacity(0.8),),
                    const SizedBox(width: 5,),
                    Text(date, style: TextStyle(color: Colors.grey.shade500.withOpacity(0.8)),)
                  ],
                )
              ],
            ),
          ),
        ),
    
      ),
    );
  }
}