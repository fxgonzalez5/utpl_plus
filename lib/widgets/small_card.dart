import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  const SmallCard({
    super.key, required this.image, required this.title, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: Colors.grey.shade500.withOpacity(0.8),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  date,
                  style:
                      TextStyle(fontSize: 13, color: Colors.grey.shade500.withOpacity(0.8)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
