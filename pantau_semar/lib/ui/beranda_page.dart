import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/newslist_model.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';
import 'package:pantau_semar/widget/weather_widget.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/customscrollablecolumnitem_widget.dart';

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

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    int _currentIndex = 0;

    List<String> _texts = [
      "KYAI SALEH",
      "ABDURAHMAN SALEH",
      "SIMPANG LIMA",
      "BALAI KOTA"
      "THAMRIN",
      "MILO",
      "BANKONG",
      "KALIBANTENG",
      "KARIADI",
      "GAYAMSARI",
      "ANJASMORO"
    ];

    void _startRotating() {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _texts.length;
          _startRotating();
        });
      });
    }

    @override
    void initState() {
      super.initState();
      _startRotating();
    }

    return Scaffold(
      drawer: MenuSamping(),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: primary),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: 200,
                            autoPlay: true),
                        items: imageSliders),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mau Lihat CCTV Apa ?",
                        style: text.copyWith(color: danger),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mulai jelajahi kota semarang sekarang",
                        style: text.copyWith(color: muted),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CustomScrollableColumnItem(
                              icon: Icons.traffic,
                              text: 'Lalu lintas',
                              onTap: () {
                                // Handler when item is tapped
                                print('Item tapped');
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomScrollableColumnItem(
                              icon: Icons.house,
                              text: 'Fasum',
                              onTap: () {
                                // Handler when item is tapped
                                print('Item tapped');
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomScrollableColumnItem(
                              icon: Icons.landscape,
                              text: 'Kota lama',
                              onTap: () {
                                // Handler when item is tapped
                                print('Item tapped');
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomScrollableColumnItem(
                              icon: Icons.water,
                              text: 'Sungai',
                              onTap: () {
                                // Handler when item is tapped
                                print('Item tapped');
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomScrollableColumnItem(
                              icon: Icons.shield,
                              text: 'Kamtib',
                              onTap: () {
                                // Handler when item is tapped
                                print('Item tapped');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: danger, borderRadius: BorderRadius.circular(16)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Perkiraan Cuaca Kota Semarang",
                    style: text.copyWith(color: danger),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: danger,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: WeartherPage(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CCTV Lalu Lintas",
                        style: text.copyWith(color: danger),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lihat Selengkapnya",
                          style: textSm.copyWith(color: muted),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: danger,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: DefaultTextStyle(
                            style: text.copyWith(color: primary),
                            child: AnimatedTextKit(animatedTexts: [
                              FadeAnimatedText("KYAI SALEH"),
                              FadeAnimatedText("ABDRURAHMAN SALEH"),
                              FadeAnimatedText("SIMPANG LIMA"),
                              FadeAnimatedText("TUGU MUDA"),
                              FadeAnimatedText("BALAI KOTA"),
                              FadeAnimatedText("SURATMO"),
                              FadeAnimatedText("SAMPANGAN"),
                              FadeAnimatedText("TEMBALANG"),
                            ])),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seputar Kota Semarang",
                        style: text.copyWith(color: danger),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lihat Selengkapnya",
                          style: textSm.copyWith(color: muted),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    width: double.infinity,
                    height: 218,
                    child: ListView.builder(
                        itemCount: newsListSemarang.length,
                        itemBuilder: (context, index) {
                          final newsList berita = newsListSemarang[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: danger,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: double.infinity,
                                        child: Image.network(berita.urlImage,
                                            fit: BoxFit.fill),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              berita.judul,
                                              style: textSm.copyWith(
                                                  color: primary),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              berita.tanggal,
                                              style: textSm.copyWith(
                                                  color: primary),
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
                          );
                        }),
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
