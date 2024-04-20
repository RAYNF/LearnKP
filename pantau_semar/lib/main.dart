import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/bantuan_page.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/daftarcctv_page.dart';
import 'package:pantau_semar/ui/detailnews_page.dart';
import 'package:pantau_semar/ui/splashScreen_page.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';
import 'package:pantau_semar/ui/tentang_page.dart';
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
      // initialRoute: Beranda.routeName,
      // routes: {
      //   SplashScreen.routeName: (context) => SplashScreen(),
      //   Welcome.routeName: (context) => Welcome(),
      //   Beranda.routeName: (context) => Beranda(),
      //   Bantuan.routeName: (context) => Bantuan(),
      //   Tentang.routeName: (context) => Tentang(),
      //   DetailNews.routeName: (context) => DetailNews()
      // },
      home: TampilanCctv(),
    );
  }
}
