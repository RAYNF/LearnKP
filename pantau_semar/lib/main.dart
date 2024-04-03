import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/splashScreen_page.dart';
import 'package:pantau_semar/ui/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Beranda.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        Welcome.routeName: (context) => Welcome(),
        Beranda.routeName: (context) => Beranda()
      },
    );
  }
}
