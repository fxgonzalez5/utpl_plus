import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AcctionButton extends StatelessWidget {
  final String image;
  final String title;

  const AcctionButton({
    super.key, required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Share.share(image, subject: title),
      
      child: Container(
        width: 40,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.amber[700],
          borderRadius: BorderRadius.circular(5)
        ),
        child: const Icon(
          Icons.share,
          color: Colors.white,
        )
      ),
    );
  }
}