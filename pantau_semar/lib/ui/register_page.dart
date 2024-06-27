import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/data/provider/registerServiceProvider.dart';
import 'package:pantau_semar/ui/login_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone_number = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visibility = true;

  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _phone_number.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      final registerServiceProvider =
          Provider.of<RegisterServiceProvider>(context, listen: false);
      registerServiceProvider
          .register(
              _email.text, _password.text, _username.text, _phone_number.text)
          .then((_) {
        if (registerServiceProvider.registerResponseModel!.succes != false) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("alertDialog1_register").tr(),
                content: Text(
                    registerServiceProvider.registerResponseModel!.message),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text("alertDialog2_register").tr(),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("alertDialog3_register").tr(),
                content: Text("alertDialog4_register").tr(),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("alertDialog15_beranda").tr(),
                  ),
                ],
              );
            },
          );
        }
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("alertdialog18_beranda").tr(),
              content: Text(error.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("alertdialog15_beranda").tr(),
                ),
              ],
            );
          },
        );
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password harus lebih dari 8 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "btn2_onboarding",
                        style: headings,
                        textAlign: TextAlign.center,
                      ).tr()
                    ],
                  ),
                  SizedBox(height: 100),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      hintText: 'title2_login'.tr(),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'title1_register'.tr(),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                    ),
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _phone_number,
                    decoration: InputDecoration(
                      hintText: 'title2_register'.tr(),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor HP tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _password,
                    obscureText: visibility,
                    decoration: InputDecoration(
                      hintText: 'title3_login'.tr(),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
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
                        borderSide: BorderSide(color: primary),
                      ),
                    ),
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _registerUser();
                    },
                    child: Text("btn2_onboarding",
                            style: heading.copyWith(color: Colors.black))
                        .tr(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: danger,
                        minimumSize: Size(screenWidth.width, 60)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("title3_register").tr(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: Text(
                            "btn2_onboarding",
                            style: text.copyWith(color: Colors.purple),
                          ).tr())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
