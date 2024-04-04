import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/welcome_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class Beranda extends StatefulWidget {
  static const routeName = '/beranda';

  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
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
        title: Column(
          children: [
            Text(
              "PantauSemar",
              style: heading.copyWith(color: primary),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Layanan CCTV Integrasi Kota Semarang",
              style: textSm.copyWith(color: primary),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
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
        actions: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Image.asset(
              "assets/logo_appbar.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
        //belum bisa buka drawer
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Container(
                height: screenSize.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: primary),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [Text("hai")],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
