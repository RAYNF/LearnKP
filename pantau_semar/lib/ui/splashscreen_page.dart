import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pantau_semar/data/provider/loginServiceProvider.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/welcome_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  String username = "";
  String password = "";

  Future<void> checkLoginStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool loginStatus = pref.getBool("isLogin") ?? false;
    if (loginStatus) {
      String user = pref.getString("username") ?? "";
      String pass = pref.getString("password") ?? "";
      setState(() {
        isLogin = loginStatus;
        username = user;
        password = pass;
      });
      login();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    }
  }

    void login() {
    final apiServiceProvider =
        Provider.of<LoginServiceProvider>(context, listen: false);
    apiServiceProvider.login(username, password).then((_) {
      if (apiServiceProvider.userModel != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Beranda(dataUser: apiServiceProvider.userModel!.data!);
        }));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkLoginStatus();
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
