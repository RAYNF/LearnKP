import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;
import 'package:pantau_semar/data/model/location_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/tampilancctv_page.dart';

class Maps extends StatefulWidget {
  final Data dataUser;
  const Maps({super.key, required this.dataUser});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late final MapController _mapController;
  late LatLng.LatLng postion;
  void initState() {
    _mapController = MapController();
    postion = LatLng.LatLng(-6.999274084967515, 110.42000818158822);

    super.initState();
  }

  List<Marker> getMarkers() {
    return List<Marker>.from(
      FakeData.fakeLocation.map(
        (e) => new Marker(
          point: LatLng.LatLng(e.latitude, e.longtitude),
          child: InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return TampilanCctv(dataUser: widget.dataUser,);
              // }));
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
          initialZoom: 15,
          //cari lokasi
          // onPositionChanged: (position, hasGesture) {
          //   print(
          //       "latitude ${position.center!.latitude.toString()} longtitude ${position.center!.longitude.toString()}");
          // },
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
