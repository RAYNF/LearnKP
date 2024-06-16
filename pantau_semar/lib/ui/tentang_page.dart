import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class Tentang extends StatelessWidget {
  static const routeName = '/tentang';
  final Data dataUser;
  const Tentang({super.key, required this.dataUser});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuSamping(
        dataUser: dataUser,
      ),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Text("title1_tentang", style: heading.copyWith(color: primary)).tr(),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: primary,
            ),
          );
        }),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: primary),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: danger, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: muted),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primary,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.asset(
                                      "assets/logo_appbar.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "title2_tentang",
                                    style: subHeading.copyWith(color: primary),
                                  ).tr(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "title3_tentang",
                                    style: textSm.copyWith(color: primary),
                                  ).tr()
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "title4_tentang",
                          style: textSm.copyWith(color: primary),
                        ).tr(),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
