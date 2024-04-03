import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/ui/welcome_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Welcome.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: screenSize.height/5.5),
            Image.asset('assets/logo_splashscreen.png'),
            Text(
              "PantauSemar",
              style: heading.copyWith(color: danger)
            )
          ],
        ),
      )),
    );
  }
}
