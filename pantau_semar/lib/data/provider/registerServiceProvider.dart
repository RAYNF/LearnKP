import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/registerresponse_model.dart';

class RegisterServiceProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  RegisterResponseModel? _registerResponseModel;
  RegisterResponseModel? get registerResponseModel => _registerResponseModel;

  Future<void> register(String email, String password, String username,
      String phone_number) async {
    try {
      _registerResponseModel = await _apiService.userRegister(
          email, password, username, phone_number);
      notifyListeners();
    } catch (e) {
      print("Register failed: $e");
    }
  }
}
