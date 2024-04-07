import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart'; // Assuming your theme file path

        // Bantuan 

class Coba3 extends StatelessWidget {
  const Coba3({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: danger, 
      appBar: AppBar(
        backgroundColor: danger, 
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: primary, 
          ),
          onPressed: () {},
        ),
        title: Text(
          'Bantuan',
          style: heading.copyWith(color: primary), 
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primary, 
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildContactItem(Icons.email, 'Email:', 'semarangpemkot@semarangkota.go.id'),
              _buildContactItem(Icons.phone, 'Telp :', '(024) 3513366 - 3515871'),
              _buildContactItem(Icons.location_on_rounded, 'Lokasi :', 'Jl. Pemuda No. 148 Semarang KodePos : 50132'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: danger,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.0,
          ),
          SizedBox(width: 8.0),
          Text(
            label,
            style: text.copyWith(color: primary), 
          ),
          SizedBox(width: 4.0),
          Text(
            value,
            style: text.copyWith(color: primary), 
          ),
        ],
      ),
    );
  }
}