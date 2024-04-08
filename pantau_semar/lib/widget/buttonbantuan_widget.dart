import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class ButtonBantuan extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  ButtonBantuan(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: danger,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                icon,
                color: primary,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: textSm.copyWith(color: primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
