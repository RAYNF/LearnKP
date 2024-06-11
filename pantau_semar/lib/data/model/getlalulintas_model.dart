class GetLaluLintasModel {
  bool success;
  String message;
  List<LaluLinta> laluLintas;

  GetLaluLintasModel({
    required this.success,
    required this.message,
    required this.laluLintas,
  });

  factory GetLaluLintasModel.fromJson(Map<String, dynamic> json) =>
      GetLaluLintasModel(
        success: json["success"],
        message: json["message"],
        laluLintas: List<LaluLinta>.from(
            json["Lalu Lintas"].map((x) => LaluLinta.fromJson(x))),
      );
}

class LaluLinta {
  String id;
  String cctvCategoriesId;
  String kelurahanId;
  String name;
  String ipNvr;
  String status;
  String username;
  String password;
  String lat;
  String ing;

  LaluLinta({
    required this.id,
    required this.cctvCategoriesId,
    required this.kelurahanId,
    required this.name,
    required this.ipNvr,
    required this.status,
    required this.username,
    required this.password,
    required this.lat,
    required this.ing,
  });

  factory LaluLinta.fromJson(Map<String, dynamic> json) => LaluLinta(
        id: json["id"],
        cctvCategoriesId: json["cctv_categories_id"],
        kelurahanId: json["kelurahan_id"],
        name: json["name"],
        ipNvr: json["ip_nvr"],
        status: json["status"],
        username: json["username"],
        password: json["password"],
        lat: json["lat"],
        ing: json["ing"],
      );
}
