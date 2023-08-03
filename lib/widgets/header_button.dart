import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final int id;
  final String text;
  final VoidCallback onPressed;
  final int selectedIndex;

  const HeaderButton({
    super.key, required this.id, required this.text, required this.onPressed, required this.selectedIndex
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
        backgroundColor: (id == selectedIndex) 
          ? MaterialStatePropertyAll(Colors.amber.shade700)
          : const MaterialStatePropertyAll(Colors.white),  
        shape: const MaterialStatePropertyAll(StadiumBorder()),
      ),
      child: Text(text, style: TextStyle(color: (id == selectedIndex) ? Colors.white : Colors.black38),),
    );
  }
}