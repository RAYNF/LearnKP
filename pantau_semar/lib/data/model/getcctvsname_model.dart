class GetCctvsNameModel {
    bool success;
    String message;
    List<CctvsName> cctvsName;

    GetCctvsNameModel({
        required this.success,
        required this.message,
        required this.cctvsName,
    });

    factory GetCctvsNameModel.fromJson(Map<String, dynamic> json) => GetCctvsNameModel(
        success: json["success"],
        message: json["message"],
        cctvsName: List<CctvsName>.from(json["CctvsName"].map((x) => CctvsName.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "CctvsName": List<dynamic>.from(cctvsName.map((x) => x.toJson())),
    };
}

class CctvsName {
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

    CctvsName({
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

    factory CctvsName.fromJson(Map<String, dynamic> json) => CctvsName(
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "cctv_categories_id": cctvCategoriesId,
        "kelurahan_id": kelurahanId,
        "name": name,
        "ip_nvr": ipNvr,
        "status": status,
        "username": username,
        "password": password,
        "lat": lat,
        "ing": ing,
    };
}
