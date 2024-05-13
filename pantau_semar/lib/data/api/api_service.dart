import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pantau_semar/data/model/getberita_model.dart';
import 'package:pantau_semar/data/model/registerresponse_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';

class ApiService {
  static const String _baseUrl =
      "http://192.168.67.214/belajar/LearnKP/pantau_semar/lib/data/database/";
  static const String _login = "login.php";
  static const String _register = "register.php";
  static const String _getberita = "getBerita.php";

  Future<UserModel> userLogin(String username, String password) async {
    final response = await http.post(Uri.parse("$_baseUrl$_login"),
        body: {"username": username, "password": password});
    //hasil respon berupa json array
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal terkoneksi");
    }
  }

  Future<RegisterResponseModel> userRegister(String email, String password,
      String username, String phone_number) async {
    final response = await http.post(Uri.parse("$_baseUrl$_register"), body: {
      "email": email,
      "password": password,
      "username": username,
      "phone_number": phone_number
    });
    //hasil respon berupa json object
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal terkoneksi");
    }
  }

  Future<GetBeritaModel> getBerita() async {
    final response = await http.get(Uri.parse("$_baseUrl$_getberita"));
    if (response.statusCode == 200) {
      return GetBeritaModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal ambil berita");
    }
  }
}
