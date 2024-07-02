import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/buttonbantuan_widget.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatefulWidget {
  static const routeName = '/bantuan';
  final Data dataUser;
  const Bantuan({super.key, required this.dataUser});

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Future<void> call(String phoneNumber) async {
      await launch('tel:$phoneNumber');
    }

    Future<void> sendEmail(String email) async {
      await launch('mailto:$email');
    }

    Future<void> openUrl(String url,
        {bool forceWebview = false, bool enableJavaScript = false}) async {
      await launch(url,
          forceWebView: forceWebview, enableJavaScript: enableJavaScript);
    }

    return Scaffold(
      drawer: MenuSamping(
        dataUser: widget.dataUser,
      ),
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Text("title1_bantuan", style: heading.copyWith(color: primary))
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
                ButtonBantuan(
                    icon: Icons.email,
                    text: "title2_bantuan".tr(),
                    onTap: () async {
                      sendEmail("semarangpemkot@semarangkota.go.id");
                    }),
                SizedBox(
                  height: 20,
                ),
                ButtonBantuan(
                    icon: Icons.call,
                    text: "title3_bantuan".tr(),
                    onTap: () async {
                      await call('0243513366');
                    }),
                SizedBox(
                  height: 20,
                ),
                ButtonBantuan(
                    icon: Icons.map,
                    text: "title4_bantuan".tr(),
                    onTap: () async {
                      await openUrl(
                        'https://www.google.com/maps/place/Dinas+Komunikasi,+Informatika,+Statistik+dan+Persandian+Kota+Semarang/@-6.9832533,110.4110619,17z/data=!3m1!4b1!4m6!3m5!1s0x2e708bb22883d313:0xc7b865c010d779de!8m2!3d-6.9832586!4d110.4136368!16s%2Fg%2F11fnb0dxcr?entry=ttu',
                        forceWebview: true,
                        enableJavaScript: true,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
