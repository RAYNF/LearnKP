import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/bantuan_page.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/ui/notifikasi_page.dart';
import 'package:pantau_semar/ui/setting_page.dart';
import 'package:pantau_semar/ui/tentang_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class MenuSamping extends StatelessWidget {
  const MenuSamping({super.key});

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
                    "PantauSemar",
                    style: heading.copyWith(color: danger),
                  ),
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
              "Beranda",
              style: subHeading.copyWith(color: danger),
            ),
            onTap: () {
              // Navigator.pushNamed(context, Beranda.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Beranda();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: danger,
            ),
            title: Text(
              "Tentang",
              style: subHeading.copyWith(color: danger),
            ),
            onTap: () {
              // Navigator.pushNamed(context, Tentang.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Tentang();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: danger,
            ),
            title: Text(
              "Bantuan",
              style: subHeading.copyWith(color: danger),
            ),
            onTap: () {
              // Navigator.pushNamed(context, Bantuan.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Bantuan();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: danger,
            ),
            title: Text(
              "Settings",
              style: subHeading.copyWith(color: danger),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Setting();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: danger,
            ),
            title: Text(
              "Notifications",
              style: subHeading.copyWith(color: danger),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Notifikasi();
              }));
            },
          ),
        ],
      ),
    );
  }
}
