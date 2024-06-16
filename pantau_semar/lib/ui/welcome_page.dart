import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/onboarding_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/welcome';
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/welcome_background.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height / 1.8,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: danger, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Text(
                          "PantauSemar",
                          style: heading.copyWith(color: primary),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "slogan1_welcome",
                              style: subHeading.copyWith(color: primary),
                            ).tr(),
                            Text(
                              "slogan2_welcone",
                              style: subHeading.copyWith(color: primary),
                            ).tr()
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "btn1_welcome",
                                style: heading.copyWith(color: danger),
                              ).tr(),
                            ),
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return OnBoarding();
                            }));
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
