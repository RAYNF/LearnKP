import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selamat Datang di Aplikasi",
                  style: heading,
                ),
                Text(
                  "Pantau Semar",
                  style: heading,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
