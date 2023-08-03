import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String image;
  final bool clicked;

  const HeaderImage(this.image, {
    super.key, this.clicked = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: (clicked) ? 1.0 : 2.2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.contain
          )
        ),
      ),
    );
  }
}
