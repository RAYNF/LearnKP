import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/getcctvlinks_model.dart';
import 'package:pantau_semar/data/model/getlalulintas_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menuopsicctv_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class DaftarCctvGeneric extends StatefulWidget {
  final List<LaluLinta> Lalulintas;

  final Data dataUser;
  const DaftarCctvGeneric(
      {super.key, required this.Lalulintas, required this.dataUser});

  @override
  State<DaftarCctvGeneric> createState() => _DaftarCctvGenericState();
}

class _DaftarCctvGenericState extends State<DaftarCctvGeneric> {
  late Future<GetCctvLinksModel> _getCctvLinksApi;
  late GetCctvLinksModel getCctvLinksModel;

  void _getCctvs(int cctv_id) {
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
                title: Text("alertDialog3_cctvlalulintas".tr()),
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
      } else {
        print("alertdialog16_beranda".tr());
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
      body: ListView(
        children: [
          SizedBox(
            height: 20,
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
                  if (widget.Lalulintas.isNotEmpty)
                    Container(
                      height: 500,
                      width: screenSize.width,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                        itemCount: widget.Lalulintas.length,
                        itemBuilder: (BuildContext context, index) {
                          return MenuOpsiCctv(
                            title: widget.Lalulintas[index].name,
                            onTap: () {
                              _getCctvs(int.parse(widget.Lalulintas[index].id));
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
