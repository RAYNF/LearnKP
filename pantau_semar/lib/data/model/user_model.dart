class UserModel {
  bool success;
  String message;
  Data? data;

  UserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );
}

class Data {
  String id;
  String email;
  String password;
  String username;
  String phoneNumber;
  String level;

  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.phoneNumber,
    required this.level,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        level: json["level"],
      );
}
