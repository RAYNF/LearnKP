import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF4F0F0),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: screenSize.height/5.5),
            Image.asset('assets/logo_splashscreen.png'),
            Text(
              "PantauSemar",
              style: GoogleFonts.poppins(
                  fontSize : 24,
                  fontWeight: FontWeight.w700,
                  color:Color(0xffD93A3A)
                  ),
            )
          ],
        ),
      )),
    );
  }
}
