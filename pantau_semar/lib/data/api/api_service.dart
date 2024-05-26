import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:pantau_semar/data/model/getberita_model.dart';
import 'package:pantau_semar/data/model/getcctvlinks_model.dart';
import 'package:pantau_semar/data/model/getcctvsname_model.dart';
import 'package:pantau_semar/data/model/kecamatan_model.dart';
import 'package:pantau_semar/data/model/kelurahan_model.dart';
import 'package:pantau_semar/data/model/registerresponse_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';

class ApiService {
  static const String _baseUrl =
      "http://192.168.67.214/belajar/LearnKP/pantau_semar/lib/data/database/";
  static const String _login = "login.php";
  static const String _register = "register.php";
  static const String _getberita = "getBerita.php";
  static const String _addBerita = "tambahBerita.php";
  static const String _deleteBerita = "hapusBerita.php";
  static const String _editBerita = "editBerita.php";
  static const String _getcctvKecamatan = "getKecamatan.php";
  static const String _getcctvKelurahan = "getKelurahan.php";
  static const String _getcctvsName = 'getCctvs.php';
  static const String _getcctvLinks = 'getCctvLinks.php';

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

  Future<RegisterResponseModel> addBerita(String users_id, String judul,
      String description, String urlImage) async {
    final response = await http.post(Uri.parse("$_baseUrl$_addBerita"), body: {
      "users_id": users_id,
      "judul": judul,
      "description": description,
      "urlImage": urlImage
    });
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal tambah berita");
    }
  }

  Future<RegisterResponseModel> removeBerita(String id) async {
    final response =
        await http.post(Uri.parse("$_baseUrl$_deleteBerita"), body: {"id": id});
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal hapus berita");
    }
  }

  Future<RegisterResponseModel> UpdateBerita(String users_id, String judul,
      String description, String urlImage, String idBerita) async {
    final response = await http.post(Uri.parse("$_baseUrl$_editBerita"), body: {
      "users_id": users_id,
      "judul": judul,
      "description": description,
      "urlImage": urlImage,
      "id": idBerita
    });
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal tambah berita");
    }
  }

  Future<KecamatanModel> getKecamatan(String name) async {
    final response = await http
        .post(Uri.parse("$_baseUrl$_getcctvKecamatan"), body: {"name": name});
    //hasil respon berupa json array
    if (response.statusCode == 200) {
      return KecamatanModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal dapat data kelurahan");
    }
  }

  Future<KelurahanModel> getKelurahan(int kecamatan_id) async {
    final response = await http.post(Uri.parse("$_baseUrl$_getcctvKelurahan"),
        body: {"kecamatan_id": kecamatan_id.toString()});
    //hasil respon berupa json array
    if (response.statusCode == 200) {
      return KelurahanModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal dapat data kelurahan");
    }
  }

  Future<GetCctvsNameModel> getCctvName(
      String idKelurahan, int categories_id) async {
    final response =
        await http.post(Uri.parse("$_baseUrl$_getcctvsName"), body: {
      "kelurahan_id": idKelurahan.toString(),
      "cctv_categories_id": categories_id.toString()
    });
    //hasil respon berupa json array
    if (response.statusCode == 200) {
      return GetCctvsNameModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal dapat data kelurahan");
    }
  }

    Future<GetCctvLinksModel> getCctvLinks(int cctv_id) async {
    final response = await http.post(Uri.parse("$_baseUrl$_getcctvLinks"),
        body: {"cctv_id": cctv_id.toString()});
    //hasil respon berupa json array
    if (response.statusCode == 200) {
      return GetCctvLinksModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("gagal dapat data cctvLinks");
    }
  }
}
