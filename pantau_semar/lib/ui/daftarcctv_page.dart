import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

const List<String> data = <String>['One', 'Two', 'Three', 'Four'];

class DaftaCctv extends StatefulWidget {
  const DaftaCctv({super.key});
  @override
  State<DaftaCctv> createState() => _DaftarCctv();
}

class _DaftarCctv extends State<DaftaCctv> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuSamping(),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        title: Text("CCTV", style: heading.copyWith(color: primary)),
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
                  Text(
                    "Explore",
                    style: subHeading.copyWith(color: danger),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pilih menu area pemantau CCTV",
                    style: text.copyWith(color: muted),
                  ),
                  SizedBox(
                    height: 20,
                  ),
              
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

