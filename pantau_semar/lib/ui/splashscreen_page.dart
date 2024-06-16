import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Welcome();
      }));
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
            SizedBox(height: screenSize.height / 5.5),
            Image.asset('assets/logo_splashscreen.png'),
            Text("alertdialog17_beranda",
                    style: heading.copyWith(color: danger))
                .tr()
          ],
        ),
      )),
    );
  }
}
