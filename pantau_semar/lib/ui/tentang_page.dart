import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class Tentang extends StatelessWidget {
  static const routeName = '/tentang';
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuSamping(),
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
            width: screenSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: primary),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: danger, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: muted),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primary,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.asset(
                                      "assets/logo_appbar.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "PANTAUSEMAR v1.4.1",
                                    style: subHeading.copyWith(color: danger),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "2024 Pemerintah Kota Semarang",
                                    style: textSm.copyWith(color: danger),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "PantauSemar adalah aplikasi inovatif yang dirancang khusus untuk memudahkan warga Kota Semarang dalam mengakses informasi dan memantau langsung berbagai CCTV yang tersebar di seluruh penjuru kota. Dengan PantauSemar, Anda dapat:\n\n1. Melihat CCTV di Berbagai Tempat:\n- Pantau kondisi lalu lintas secara real-time di berbagai titik strategis.\n- Awasi situasi di kantor pelayanan publik seperti kelurahan, kecamatan, dan dinas-dinas terkait.\n- Pastikan keamanan dan kebersihan sungai dengan melihat langsung CCTV di area sungai.\n\n2. Mendapatkan Berita Terbaru:\n- Dapatkan informasi terkini seputar Kota Semarang dengan mudah dan cepat.\n- Temukan berita terbaru tentang peristiwa, kebijakan pemerintah, dan kegiatan di berbagai wilayah Semarang.\n- Selalu update dengan informasi penting yang dapat membantu Anda dalam keseharian.\n\n3. Mengetahui Perkiraan Cuaca:\n- Lihat perkiraan cuaca akurat untuk Kota Semarang dalam beberapa hari ke depan.\n- Rencanakan aktivitas Anda dengan lebih baik berdasarkan informasi cuaca yang terpercaya.\n- Hindari potensi cuaca buruk dan persiapkan diri untuk berbagai kemungkinan.",
                          style: textSm.copyWith(color: primary),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
