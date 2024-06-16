import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/bantuan_page.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/setting_page.dart';
import 'package:pantau_semar/ui/tentang_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class MenuSamping extends StatelessWidget {
  final Data dataUser;
  const MenuSamping({super.key, required this.dataUser});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xffADADAD)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      "assets/logo_appbar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "title1_menusamping",
                    style: heading.copyWith(color: danger),
                  ).tr(),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: danger,
            ),
            title: Text(
              "title2_menusamping",
              style: subHeading.copyWith(color: danger),
            ).tr(),
            onTap: () {
              // Navigator.pushNamed(context, Beranda.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Beranda(
                  dataUser: dataUser,
                );
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: danger,
            ),
            title: Text(
              "title3_menusamping",
              style: subHeading.copyWith(color: danger),
            ).tr(),
            onTap: () {
              // Navigator.pushNamed(context, Tentang.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Tentang(
                  dataUser: dataUser,
                );
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: danger,
            ),
            title: Text(
              "title4_menusamping",
              style: subHeading.copyWith(color: danger),
            ).tr(),
            onTap: () {
              // Navigator.pushNamed(context, Bantuan.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Bantuan(
                  dataUser: dataUser,
                );
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: danger,
            ),
            title: Text(
              "title5_menusamping",
              style: subHeading.copyWith(color: danger),
            ).tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Setting(
                  dataUser: dataUser,
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
