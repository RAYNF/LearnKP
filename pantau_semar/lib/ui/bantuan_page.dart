import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/buttonbantuan_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class Bantuan extends StatefulWidget {
  static const routeName = '/bantuan';
  final Data dataUser;
  const Bantuan({super.key, required this.dataUser});

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuSamping(
        dataUser: widget.dataUser,
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
