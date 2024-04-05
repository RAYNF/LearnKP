import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class CustomScrollableColumnItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomScrollableColumnItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: muted,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              size: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: textSm.copyWith(color: primary),
          ),
        ],
      ),
    );
  }
}
