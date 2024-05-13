import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/getberita_model.dart';
import 'package:pantau_semar/data/model/newslist_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class DetailNews extends StatefulWidget {
  static const routeName = '/detail-news';
  final Berita berita;
  
  const DetailNews({super.key, required this.berita});

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: danger,
      appBar: AppBar(
          backgroundColor: danger,
          centerTitle: true,
          title: Text("Bantuan", style: heading.copyWith(color: primary)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: primary,
          )),
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
                    widget.berita.judul,
                    textAlign: TextAlign.center,
                    style: subHeading.copyWith(color: danger),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: screenSize.height / 3,
                    child: Image.network(widget.berita.urlImage),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.berita.tanggal.toString(),
                    style: textSm.copyWith(color: danger),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.berita.description,
                    style: text.copyWith(color: danger),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.berita.usersId,
                        style: textSm.copyWith(color: danger),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
