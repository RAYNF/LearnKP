import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pantau_semar/utils/Theme.dart';

class WeartherPage extends StatefulWidget {
  static const routeName = '/weather-page';
  const WeartherPage({super.key});

  @override
  State<WeartherPage> createState() => _WeartherPageState();
}

class _WeartherPageState extends State<WeartherPage> {
  String apiKey = '5bf9303e2590b98eb138dc5087123f90';
  String city = 'London'; // Ganti dengan kota yang ingin Anda dapatkan cuacanya

  Future<Map<String, dynamic>> fetchWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=semarang&appid=$apiKey"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("gagal bro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(32)),
      child: Center(
        child: FutureBuilder(
            future: fetchWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("gagal loading");
              } else {
                var weatherData = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' ${weatherData?['name']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Temperature: ${weatherData?['main']['temp']} °C',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Description: ${weatherData?['weather'][0]['main']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
