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
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: muted,
        borderRadius: BorderRadius.circular(32),
      ),
      child: FutureBuilder<Map<String, dynamic>>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Failed to load weather data");
          } else {
            var weatherData = snapshot.data;
            var iconCode = weatherData?['weather'][0]['icon'];
            var iconUrl = "http://openweathermap.org/img/wn/$iconCode@2x.png";
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.network(iconUrl),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                      '${weatherData?['weather'][0]['main']}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      'Suhu : ${weatherData?['main']['temp']} °C',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kelembapan : ${weatherData?['main']['humidity']}%',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
