import 'package:flutter/material.dart';

class MenuOpsiCctv extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuOpsiCctv({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(color: Colors.amber),
        child: Text(title),
      ),
    );
  }
}
