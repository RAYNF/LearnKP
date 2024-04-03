import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class Beranda extends StatefulWidget {
  static const routeName = '/beranda';

  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //halaman tampil
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        centerTitle: true,
        title: Column(
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Container(
                height: screenSize.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: primary),
                child: Center(
                  child: _widgetOptions[_selectedIndex],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
