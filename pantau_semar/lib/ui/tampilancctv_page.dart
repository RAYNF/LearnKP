import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/getcctvlinks_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';
import 'package:pantau_semar/widget/vidioplayer_widget.dart';

class TampilanCctv extends StatefulWidget {
  final Data dataUser;
  final CctvLinks cctvLinks;
  const TampilanCctv(
      {super.key, required this.dataUser, required this.cctvLinks});

  @override
  State<TampilanCctv> createState() => _TampilanCctvState();
}

class _TampilanCctvState extends State<TampilanCctv> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    print(widget.cctvLinks.link.toString());
    return Scaffold(
      drawer: MenuSamping(
        dataUser: widget.dataUser,
      ),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Text("title1_tampilan", style: heading.copyWith(color: primary))
            .tr(),
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
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: primary),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPlayerScreen(
                  vidioURL: widget.cctvLinks.link,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
