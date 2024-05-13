import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/buttonbantuan_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';
import 'package:pantau_semar/widget/vidioplayer_widget.dart';

class TampilanCctv extends StatefulWidget {
  final Datum dataUser;
  const TampilanCctv({super.key, required this.dataUser});

  @override
  State<TampilanCctv> createState() => _TampilanCctvState();
}

class _TampilanCctvState extends State<TampilanCctv> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuSamping(dataUser: widget.dataUser,),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Text("Tampilan CCTV", style: heading.copyWith(color: primary)),
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
                children: [VideoPlayerScreen()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
