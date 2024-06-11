class KecamatanModel {
  bool success;
  String message;
  Kecamatan kecamatan;

  KecamatanModel({
    required this.success,
    required this.message,
    required this.kecamatan,
  });

  factory KecamatanModel.fromJson(Map<String, dynamic> json) => KecamatanModel(
        success: json["success"],
        message: json["message"],
        kecamatan: Kecamatan.fromJson(json["kecamatan"]),
      );
}

class Kecamatan {
  String id;
  String name;

  Kecamatan({
    required this.id,
    required this.name,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        id: json["id"],
        name: json["name"],
      );
}
