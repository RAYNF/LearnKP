import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/welcome_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  String username = "";
  String password = "";
  late Future<UserModel> _login;
  late UserModel userModel;

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
    _login = ApiService().userLogin(username, password);
    _login.then((value) {
      userModel = value;
      print(userModel.data?.username);
      if (userModel.success != false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Beranda(
            dataUser: userModel.data!,
          );
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
