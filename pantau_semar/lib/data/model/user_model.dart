class UserModel {
    String id;
    String email;
    String password;
    String username;
    String phoneNumber;
    String level;

    UserModel({
       required this.id,
       required this.email,
       required this.password,
       required this.username,
       required this.phoneNumber,
       required this.level,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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