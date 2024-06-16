import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
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
  late Future<UserModel> _login;
  late UserModel userModel;

  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
    _verifypassword.dispose();
  }

  void login() {
    _login = ApiService().userLogin(_username.text, _password.text);
    _login.then((value) {
      userModel = value;
      print(userModel.data?.username);
      if (userModel.success != false) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Beranda(dataUser: userModel.data!,);
        }));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("alerDialog1_login").tr(),
              content: Text("alertDialog2_login").tr(),
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
                          "btn1_onboarding",
                          style: headings,
                          textAlign: TextAlign.center,
                        ).tr()
                      ],
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    TextField(
                      controller: _username,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'title2_login'.tr(),
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
                        hintText: 'title3_login'.tr(),
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
                          icon: Icon(visible
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
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text("btn1_onboarding",
                          style: heading.copyWith(color: Colors.black)).tr(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: danger,
                          minimumSize: Size(screenWidth.width, 60)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("title4_login").tr(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
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
              ))),
    );
  }
}
