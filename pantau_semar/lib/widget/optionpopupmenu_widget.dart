import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class OpsiPopupMenu extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  OpsiPopupMenu({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              text,
              style: textSm.copyWith(color: primary),
            )),
        decoration: BoxDecoration(
          color: Colors
              .red, // sesuaikan warna latar belakang sesuai kebutuhan Anda
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
      ),
      onTap: onTap,
    );
  }
}
