import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class Bantuan extends StatefulWidget {
  static const routeName = '/bantuan';
  const Bantuan({super.key});

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Column(
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
              onTap: () {},
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
              onTap: () {},
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
      ),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Text("Bantuan", style: heading.copyWith(color: primary)),
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
            height: screenSize.height / 1.16,
            width: screenSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: primary),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonBantuan(
                      icon: Icons.email,
                      text: "semarangpemkot@semarangkota.go.id",
                      onTap: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBantuan(
                      icon: Icons.call,
                      text: "(024) 3513366 - 3515871",
                      onTap: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBantuan(
                      icon: Icons.map,
                      text: "Jl. Pemuda No. 148 Semarang",
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonBantuan extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  ButtonBantuan(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: danger,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                icon,
                color: primary,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: textSm.copyWith(color: primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
