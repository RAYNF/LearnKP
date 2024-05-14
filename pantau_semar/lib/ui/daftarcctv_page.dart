import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menuopsicctv_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

const List<String> data = <String>['One', 'Two', 'Three', 'Four'];

class DaftaCctv extends StatefulWidget {
  final Data dataUser;
  const DaftaCctv({super.key, required this.dataUser});
  @override
  State<DaftaCctv> createState() => _DaftarCctv();
}

class _DaftarCctv extends State<DaftaCctv> {
  String? selected;
  List<String> data = ["KYAI SALEH", "SIMPANG LIMA", "TUGU MUDA"];

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
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuOpsiCctv(
                          imagePath: "assets/lalulintas_cctv.png",
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TampilanCctv(
                                dataUser: widget.dataUser,
                              );
                            }));
                          })
                      // menu 1 lagi kalau ada
                    ],
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
