import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/getcctvlinks_model.dart';
import 'package:pantau_semar/data/model/getcctvsname_model.dart';
import 'package:pantau_semar/data/model/kecamatan_model.dart';
import 'package:pantau_semar/data/model/kelurahan_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menuopsicctv_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class DaftaCctv extends StatefulWidget {
  final Data dataUser;
  final List<Kelurahan> kelurahan;
  const DaftaCctv({super.key, required this.dataUser, required this.kelurahan});
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

  late Future<GetCctvsNameModel> _getCctvsNames;
  late GetCctvsNameModel getCctvsNameModel;

  late Future<GetCctvLinksModel> _getCctvLinksApi;
  late GetCctvLinksModel getCctvLinksModel;

  void _getKecamatanApi(String name) {
    _getKecamatan = ApiService().getKecamatan(name);
    _getKecamatan.then((value) {
      setState(() {
        kecamatanModel = value;
      });
      print(kecamatanModel.kecamatan.id);
      if (kecamatanModel.success != false) {
        _getKelurahanApi =
            ApiService().getKelurahan(int.parse(kecamatanModel.kecamatan.id));
        _getKelurahanApi.then((value) {
          setState(() {
            kelurahanModel = value;
          });
          if (kelurahanModel.success != false) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DaftaCctv(
                dataUser: widget.dataUser,
                kelurahan: kelurahanModel.kelurahan,
              );
            }));
          } else {
            print("respon1_beranda".tr());
          }
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("alertDialog1_cctvlalulintas").tr(),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("alertDialog15_beranda").tr(),
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
            title: Text("alertDialog18_beranda").tr(),
            content: Text(error.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("alertDialog15_beranda").tr(),
              ),
            ],
          );
        },
      );
    });
  }

  void _getCctvLinks(int cctv_id) {
    _getCctvLinksApi = ApiService().getCctvLinks(cctv_id);
    _getCctvLinksApi.then((value) {
      setState(() {
        getCctvLinksModel = value;
      });
      if (getCctvLinksModel.success != false) {
        print("alertDialog2_cctvlalulintas".tr());
        if (getCctvLinksModel.cctvLinks?.link != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TampilanCctv(
              dataUser: widget.dataUser,
              cctvLinks: getCctvLinksModel.cctvLinks!,
            );
          }));
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("alertDialog3_cctvlalulintas").tr(),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("alertDialog15_beranda").tr(),
                  ),
                ],
              );
            },
          );
        }
      } else {
        print("respon1_beranda".tr());
      }
    });
  }

  void _getCctvs(String idKelurahan, int categories_id) {
    _getCctvsNames = ApiService().getCctvName(idKelurahan, categories_id);
    _getCctvsNames.then((value) {
      getCctvsNameModel = value;
      if (getCctvsNameModel.success != false) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "alertDialog3_cctvlalulintas",
                style: subHeading.copyWith(color: danger),
              ).tr(),
              content: Text(
                "alertdialog5_beranda",
                style: text.copyWith(color: muted),
              ).tr(),
              actions: [
                FutureBuilder<GetCctvsNameModel>(
                    future: _getCctvsNames,
                    builder:
                        (context, AsyncSnapshot<GetCctvsNameModel> snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 200,
                            width: double.maxFinite,
                            child: ListView.builder(
                                itemCount: snapshot.data?.cctvsName.length,
                                itemBuilder: (context, index) {
                                  var berita = snapshot.data!.cctvsName[index];
                                  return Card(
                                    child: ListTile(
                                      title: Text(berita.name),
                                      dense: true,
                                      onTap: () {
                                        _getCctvLinks(int.parse(berita.id));
                                      },
                                    ),
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Material(
                              child: Text(snapshot.error.toString()),
                            ),
                          );
                        } else {
                          return const Material(
                            child: Text(" "),
                          );
                        }
                      }
                    })
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("alertDialog5_cctvlalulintas").tr(),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("alertdialog15_beranda").tr(),
                ),
              ],
            );
          },
        );
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
        title: Text("title1_cctvlalulintas",
                style: heading.copyWith(color: primary))
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
          width: double.infinity,
          height: screenSize.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: primary),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title2_cctvlalulintas",
                  style: subHeading.copyWith(color: danger),
                ).tr(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "title3_cctvlalulintas",
                  style: text.copyWith(color: muted),
                ).tr(),
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
                        "title4_cctvlalulintas",
                        style: text.copyWith(color: primary),
                      ).tr(),
                      items: data
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selected = value ?? "";
                        });
                        _getKecamatanApi(value!);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                if (widget.kelurahan.isNotEmpty)
                  Container(
                    height: 500,
                    width: screenSize.width,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20),
                      itemCount: widget.kelurahan.length,
                      itemBuilder: (BuildContext context, index) {
                        return MenuOpsiCctv(
                          title: widget.kelurahan[index].name,
                          onTap: () {
                            _getCctvs(widget.kelurahan[index].id, 101);
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
      ),
    );
  }
}
