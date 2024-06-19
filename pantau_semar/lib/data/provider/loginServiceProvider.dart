import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/user_model.dart';

class LoginServiceProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> login(String username, String password) async {
    try {
      _userModel = await _apiService.userLogin(username, password);
      notifyListeners();
    } catch (e) {
      print("Login failed: $e");
    }
  }
}
