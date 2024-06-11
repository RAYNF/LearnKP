class KelurahanModel {
  bool success;
  String message;
  List<Kelurahan> kelurahan;

  KelurahanModel({
    required this.success,
    required this.message,
    required this.kelurahan,
  });

  factory KelurahanModel.fromJson(Map<String, dynamic> json) => KelurahanModel(
        success: json["success"],
        message: json["message"],
        kelurahan: List<Kelurahan>.from(
            json["kelurahan"].map((x) => Kelurahan.fromJson(x))),
      );
}

class Kelurahan {
  String id;
  String kecamatanId;
  String name;

  Kelurahan({
    required this.id,
    required this.kecamatanId,
    required this.name,
  });

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        id: json["id"],
        kecamatanId: json["kecamatan_id"],
        name: json["name"],
      );
}
