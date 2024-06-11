import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PantauSemar',
      home: SplashScreen(),
    );
  }
}
