import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class coba extends StatelessWidget {
  const coba({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primary,),
          onPressed: () {
            
          },
        ),
        title: Text('Seputar Kota Semarang', style: heading.copyWith(color: primary),),
      ),
      body: SingleChildScrollView(
        child:   Container(
                height: screenSize.height,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: primary),
                child: Column(
          children: [
            SizedBox(height: 20,),
            
            // Judul Berita
            _buildJudulBerita(),

            // Banner Berita
            _buildBannerBerita(),

            // Tanggal Berita
            _buildTanggalBerita(),

            // Isi Berita
            _buildIsiBerita(),

          ],
        ),
      ),
      ),
      bottomNavigationBar: 
            // Sumber Berita
            _buildSumberBerita(),
    );
  }

  Widget _buildJudulBerita() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Semarang Tawang',
        style: heading.copyWith(color: Colors.black ),
      ),
    );
  }

  Widget _buildBannerBerita() {
    return Container(
      width: 468,
      height: 300,
      child: Image.asset("assets/tawang.png", fit: BoxFit.fill,),
    );
  }

  Widget _buildTanggalBerita() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(
        'Jumat, 05 April 2024',
        style: textSm.copyWith(color: Colors.black),
      ),],)
    );
  }

  Widget _buildIsiBerita() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildSumberBerita() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sumber Berita',
            style: textSm.copyWith(color: primary),
          ),
          SizedBox(width: 8.0),
          Icon(Icons.link, size: 16.0,color: primary,),
        ],
      ),
    );
  }
}