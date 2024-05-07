import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pantau_semar/ui/register_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _verifypassword = TextEditingController();
  String message = '';
  bool visible = true;

  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
    _verifypassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff28DF99),
      //   title: Text(
      //     "Register",
      //     style: GoogleFonts.poppins(
      //       fontSize: 20,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: headings,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 140,
            ),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                hintText: 'masukkan nama pengguna',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                ),
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _password,
              obscureText: visible,
              decoration: InputDecoration(
                hintText: 'masukkan password',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Text(
                "Login",
                style: heading.copyWith(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: danger,
                minimumSize: Size(screenWidth.width, 40),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun? "),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Text(
                      "Sign Up",
                      style: text.copyWith(color: Colors.purple),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
