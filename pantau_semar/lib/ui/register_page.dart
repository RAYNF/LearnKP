import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/login_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool visibility = true;

  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: headings,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
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
                    height: 20,
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'masukkan email',
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
                    height: 20,
                  ),
                  TextField(
                    controller: _password,
                    obscureText: visibility,
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
                            visibility = !visibility;
                          });
                        },
                        icon: Icon(visibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Beranda();
                      }));
                    },
                    child: Text("SIGN UP",
                        style: heading.copyWith(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: danger,
                        minimumSize: Size(screenWidth.width, 60)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: Text(
                            "Login",
                            style: text.copyWith(color: Colors.purple),
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
