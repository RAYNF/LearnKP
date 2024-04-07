import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';

class coba2 extends StatelessWidget {
  const coba2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: danger,
      appBar: AppBar(
        backgroundColor: danger,
        leading: IconButton(
          icon: Icon(Icons.menu, color: primary),
          onPressed: () {},
        ),
        title: Text('Tentang', style: heading.copyWith(color: primary)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 220,
                      height: 220,
                      child: Image.asset(
                        "assets/logo_appbar.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Pantau Semar', style: subHeading.copyWith(color: danger)),
                          Text('Pemerintah Kota Semarang 2024', style: textSm.copyWith(color: danger)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'PantauSemar adalah aplikasi inovatif yang dirancang khusus untuk memudahkan warga Kota Semarang dalam mengakses informasi dan memantau langsung berbagai CCTV yang tersebar di seluruh penjuru kota. Dengan PantauSemar, Anda dapat:',
                  style: textSm.copyWith(color: danger),
                ),
                SizedBox(height: 8.0),
                _buildFitur(
                  nomor: '1.',
                  judul: 'Melihat CCTV di Berbagai Tempat',
                  deskripsi: [
                    'Pantau kondisi lalu lintas secara real-time di berbagai titik strategis.',
                    'Awasi situasi di kantor pelayanan publik seperti kelurahan, kecamatan, dan dinas-dinas terkait.',
                    'Pastikan keamanan dan kebersihan sungai dengan melihat langsung CCTV di area sungai.',
                  ],
                ),
                _buildFitur(
                  nomor: '2.',
                  judul: 'Mendapatkan Berita Terbaru',
                  deskripsi: [
                    'Dapatkan informasi terkini seputar Kota Semarang dengan mudah dan cepat.',
                    'Temukan berita terbaru tentang peristiwa, kebijakan pemerintah, dan kegiatan di berbagai wilayah Semarang.',
                    'Selalu update dengan informasi penting yang dapat membantu Anda dalam keseharian.',
                  ],
                ),
                _buildFitur(
                  nomor: '3.',
                  judul: 'Mengetahui Perkiraan Cuaca',
                  deskripsi: [
                    'Lihat perkiraan cuaca akurat untuk Kota Semarang dalam beberapa hari ke depan.',
                    'Rencanakan aktivitas Anda dengan lebih baik berdasarkan informasi cuaca yang terpercaya.',
                    'Hindari potensi cuaca buruk dan persiapkan diri untuk berbagai kemungkinan.',
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFitur({
    required String nomor,
    required String judul,
    required List<String> deskripsi,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Text(
          '$nomor $judul',
          style: textSm.copyWith(fontWeight: FontWeight.bold, color: primary),
        ),
        SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: deskripsi.map((item) => Text(item, style: textSm.copyWith(color: danger))).toList(),
        ),
      ],
    );
  }
}
