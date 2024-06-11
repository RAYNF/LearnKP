class GetBeritaModel {
  bool success;
  String message;
  List<Berita> berita;

  GetBeritaModel({
    required this.success,
    required this.message,
    required this.berita,
  });

  factory GetBeritaModel.fromJson(Map<String, dynamic> json) => GetBeritaModel(
        success: json["success"],
        message: json["message"],
        berita:
            List<Berita>.from(json["berita"].map((x) => Berita.fromJson(x))),
      );
}

class Berita {
  String id;
  String usersId;
  String judul;
  DateTime tanggal;
  String description;
  String urlImage;

  Berita({
    required this.id,
    required this.usersId,
    required this.judul,
    required this.tanggal,
    required this.description,
    required this.urlImage,
  });

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        id: json["id"],
        usersId: json["users_id"],
        judul: json["judul"],
        tanggal: DateTime.parse(json["tanggal"]),
        description: json["description"],
        urlImage: json["urlImage"],
      );
}
