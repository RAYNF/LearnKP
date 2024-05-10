import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/login_page.dart';
import 'package:pantau_semar/ui/register_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
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
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: screenWidth.width / 1.5,
              height: screenWidth.height / 3.2,
              child: Image.asset(
                "assets/logo_appbar.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child:
                  Text("Login", style: heading.copyWith(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: danger,
                  minimumSize: Size(screenWidth.width, 60)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              },
              child:
                  Text("SIGN UP", style: heading.copyWith(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: danger,
                  minimumSize: Size(screenWidth.width, 60)),
            ),
          ],
        ),
      )),
    );
  }
}
