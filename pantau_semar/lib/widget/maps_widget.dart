import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/getcctvlinks_model.dart';
import 'package:pantau_semar/data/model/getlalulintas_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';

class Maps extends StatefulWidget {
  final Data dataUser;
  final List<LaluLinta> Lalulintas;
  const Maps({super.key, required this.dataUser, required this.Lalulintas});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late final MapController _mapController;
  late LatLng.LatLng postion;
    late Future<GetCctvLinksModel> _getCctvLinksApi;
  late GetCctvLinksModel getCctvLinksModel;

  void initState() {
    _mapController = MapController();
    postion = LatLng.LatLng(-6.999274084967515, 110.42000818158822);

    super.initState();
  }

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
                title: Text("alertDialog3_cctvlalulintas").tr(),
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


  List<Marker> getMarkers() {
    return List<Marker>.from(
      widget.Lalulintas.map(
        (e) => new Marker(
          point: LatLng.LatLng(double.parse(e.lat), double.parse(e.ing)),
          child: InkWell(
            onTap: () {
              _getCctvs(int.parse(e.id));
            },
            child: Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/mark_maps.png"),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: postion,
          initialZoom: 9,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          RichAttributionWidget(
            attributions: [],
          ),
          MarkerLayer(
            markers: getMarkers(),
          ),
        ],
      ),
    );
  }
}

