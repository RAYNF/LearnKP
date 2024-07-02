import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/login_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLanguage(Locale locale) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('languageCode', locale.languageCode);
  await prefs.setString('countryCode', locale.countryCode ?? '');
}

class Setting extends StatefulWidget {
  final Data dataUser;
  const Setting({super.key, required this.dataUser});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isLogin = false;
  String username = "";
  String password = "";

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", isLogin);
    pref.setString("username", username);
    pref.setString("password", password);
    Locale locale = Locale('en', 'US');
    await saveLanguage(locale);
    context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.25,
                        //   height: MediaQuery.of(context).size.width * 0.25,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: AssetImage("assets/guest.png")),
                        //     border: Border.all(
                        //       color: Colors.black87, // Warna border
                        //       width: 1.0, // Lebar border
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          widget.dataUser.username,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          widget.dataUser.email,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: greyColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: danger,
                      child: Row(
                        children: [
                          Text(
                            "title1_setting",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ProfileDetailInfo(
                          cat: 'title2_setting'.tr(),
                          value: '',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("title2_setting").tr(),
                                    content: Text(widget.dataUser.password),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'title3_setting'.tr(),
                          value: '',
                          noValue: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("title3_setting").tr(),
                                    content: Text(widget.dataUser.level),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'title4_setting'.tr(),
                          value: '',
                          noValue: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("title4_setting").tr(),
                                    content: Text(widget.dataUser.phoneNumber),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: danger,
                      child: Row(
                        children: [
                          Text(
                            "title5_setting",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ProfileDetailInfo(
                          cat: 'title6_setting'.tr(),
                          value: '',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("title7_setting").tr(),
                                    content: Text("title8_setting").tr(),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'title9_setting'.tr(),
                          value: '',
                          onTap: () {},
                        ),
                        ProfileDetailInfo(
                          cat: 'title10_setting'.tr(),
                          value: '',
                          onTap: () {},
                        ),
                        ProfileDetailInfo(
                          cat: 'title11_setting'.tr(),
                          value: '',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("title11_setting").tr(),
                                    actions: [
                                      Container(
                                        width: double.infinity,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  Locale locale = Locale('id');
                                                  context.setLocale(locale);
                                                  await saveLanguage(locale);
                                                },
                                                child: Text(
                                                  "title13_setting",
                                                  style: subText.copyWith(
                                                      color: whiteColor),
                                                ).tr(),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: danger,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  Locale locale =
                                                      Locale('en', 'US');
                                                  context.setLocale(locale);
                                                  await saveLanguage(locale);
                                                },
                                                child: Text("title14_setting",
                                                        style: subText.copyWith(
                                                            color: whiteColor))
                                                    .tr(),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: danger,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  saveData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text("title12_setting").tr())
          ],
        ),
      ),
    );
  }
}

class ProfileDetailInfo extends StatelessWidget {
  final String cat;
  final String value;
  final bool? noValue;
  final VoidCallback onTap;
  ProfileDetailInfo(
      {super.key,
      required this.cat,
      required this.value,
      this.noValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                cat,
                style: TextStyle(color: blackColor, fontSize: 12),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                value,
                style: TextStyle(
                    color: noValue == true ? Colors.grey : Colors.black),
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class QuestionBorderMark extends StatelessWidget {
  const QuestionBorderMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: const Icon(
        size: 13,
        Icons.question_mark_sharp,
      ),
    );
  }
}
