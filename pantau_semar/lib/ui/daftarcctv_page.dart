import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/kecamatan_model.dart';
import 'package:pantau_semar/data/model/kelurahan_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menuopsicctv_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';


class DaftaCctv extends StatefulWidget {
  final Data dataUser;
  //masuk sini sudah bawak data kecamatan default, panggil fungsi get kecamatan saat tombol daftar cctv di tekan
  final Kecamatan kecamatan;
  const DaftaCctv({super.key, required this.dataUser, required this.kecamatan});
  @override
  State<DaftaCctv> createState() => _DaftarCctv();
}

class _DaftarCctv extends State<DaftaCctv> {
  String? selected;
  List<String> data = [
    "gunung pati",
    "Semarang Tengah",
    "Semarang Utara",
    "Semarang Timur",
    "Gayamsari",
    "Genuk",
    "Pedurungan",
    "Semarang Selatan",
    "Candisari",
    "Gajahmungkur",
    "Tembalang",
    "Banyumanik",
    "Semarang Barat",
    "Mijen",
    "Ngaliyan",
    "Tugu"
  ];
  late Future<KecamatanModel> _getKecamatan;
  late KecamatanModel kecamatanModel;

  late Future<KelurahanModel> _getKelurahanApi;
  late KelurahanModel kelurahanModel;

  void _getKecamatanApi(String name) {
    _getKecamatan = ApiService().getKecamatan(name);
    _getKecamatan.then((value) {
      kecamatanModel = value;
      print(kecamatanModel.kecamatan.id);
      if (kecamatanModel.success != false) {
        //masuk ke daftar cctv page  lagi dengan request kelurahan berdasar kecamatan_id yang sama
        //blm
        //msh error
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DaftaCctv(
            dataUser: widget.dataUser,
            kecamatan: kecamatanModel.kecamatan,
          );
        }));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("kelurahan Gagal"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(error.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }

  void initState() {
    super.initState();
    _getKelurahanApi =
        ApiService().getKelurahan(int.parse(widget.kecamatan.id));
    _getKelurahanApi.then((value) {
      setState(() {
        kelurahanModel = value;
      });
      if (kelurahanModel.success != false) {
        print("sukses");
      } else {
        print("gagal");
      }
    });
  }

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
            width: double.infinity,
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
                  Container(
                    decoration: BoxDecoration(
                        color: danger, borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: DropdownButton(
                        iconEnabledColor: primary,
                        dropdownColor: danger,
                        isExpanded: true,
                        style: text.copyWith(color: primary),
                        value: selected,
                        hint: Text(
                          "Pilih area CCTV",
                          style: text.copyWith(color: primary),
                        ),
                        items: data
                            .map(
                              (e) => DropdownMenuItem(
                                //nilai
                                value: e,
                                //tampilan drodown
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            selected = value;
                          });
                          _getKecamatanApi(value!);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 300,
                    width: screenSize.width,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: kelurahanModel.kelurahan.length,
                      itemBuilder: (BuildContext context, index) {
                        return MenuOpsiCctv(
                          title: widget.kecamatan.name,
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return TampilanCctv(
                            //     dataUser: widget.dataUser,
                            //   );
                            // }));
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
