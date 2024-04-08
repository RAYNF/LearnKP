import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/bantuan_page.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
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
              Navigator.pushNamed(context, Beranda.routeName);
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
              Navigator.pushNamed(context, Tentang.routeName);
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
              Navigator.pushNamed(context, Bantuan.routeName);
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
