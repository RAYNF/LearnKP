import 'package:flutter/material.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/widget/maps_widget.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:pantau_semar/widget/menusamping_widget.dart';

class PetaCctv extends StatefulWidget {
  final Datum dataUser;
  const PetaCctv({super.key, required this.dataUser});

  @override
  State<PetaCctv> createState() => _PetaCctvState();
}

class _PetaCctvState extends State<PetaCctv> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: danger,
        appBar: AppBar(
          backgroundColor: danger,
          title: Text("CCTV", style: heading.copyWith(color: primary)),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: primary,
          ),
        ),
        body: Container(
          child: Maps(
            dataUser: widget.dataUser,
          ),
        ));
  }
}
