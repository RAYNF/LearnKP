// class UserModel {
//     String id;
//     String email;
//     String password;
//     String username;
//     String phoneNumber;
//     String level;

//     UserModel({
//        required this.id,
//        required this.email,
//        required this.password,
//        required this.username,
//        required this.phoneNumber,
//        required this.level,
//     });

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"],
//         email: json["email"],
//         password: json["password"],
//         username: json["username"],
//         phoneNumber: json["phone_number"],
//         level: json["level"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "id": id,
//     //     "email": email,
//     //     "password": password,
//     //     "username": username,
//     //     "phone_number": phoneNumber,
//     //     "level": level,
//     // };
// }

class UserModel {
  bool success;
  String message;
  List<Datum> data;

  UserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String email;
  String password;
  String username;
  String phoneNumber;
  String level;

  Datum({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.phoneNumber,
    required this.level,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "username": username,
        "phone_number": phoneNumber,
        "level": level,
      };
}
