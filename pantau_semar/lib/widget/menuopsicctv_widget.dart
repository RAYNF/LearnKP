import 'package:flutter/material.dart';

class MenuOpsiCctv extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const MenuOpsiCctv({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}