import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/getberita_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/detailnews_page.dart';

class CardArticle extends StatelessWidget {
  final Berita berita;
  final Data dataUser;
  const CardArticle({super.key, required this.berita, required this.dataUser});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailNews( berita: berita, dataUser: dataUser,);
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red, // You can change color here
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: Image.network(
                      berita
                          .urlImage, // Assuming there's a property named urlImage in your item model
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          berita
                              .judul, // Assuming there's a property named judul in your item model
                          style: TextStyle(
                            color: Colors
                                .black, // You can customize text style here
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          berita.tanggal
                              .toString(), // Assuming there's a property named tanggal in your item model
                          style: TextStyle(
                            color: Colors
                                .black, // You can customize text style here
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
