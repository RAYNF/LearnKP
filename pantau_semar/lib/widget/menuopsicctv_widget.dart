import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class MenuOpsiCctv extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  MenuOpsiCctv({super.key, required this.title, required this.onTap});

  @override
  State<MenuOpsiCctv> createState() => _MenuOpsiCctvState();
}

class _MenuOpsiCctvState extends State<MenuOpsiCctv> {
  List<String> items = [
    'https://picsum.photos/800',
    'https://picsum.photos/700',
    'https://picsum.photos/600',
    'https://picsum.photos/400',
    'https://picsum.photos/300'
  ];

  @override
  void initState() {
    super.initState();
    items.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Column(
          children: [
            Container(
              width: 150,
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                items.first,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: subText.copyWith(color: danger),
            )
          ],
        ));
  }
}
