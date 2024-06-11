class GetCctvLinksModel {
  bool success;
  String message;
  CctvLinks? cctvLinks;

  GetCctvLinksModel({
    required this.success,
    required this.message,
    this.cctvLinks,
  });

  factory GetCctvLinksModel.fromJson(Map<String, dynamic> json) =>
      GetCctvLinksModel(
          success: json["success"],
          message: json["message"],
          cctvLinks: json["cctvLinks"] != null
              ? CctvLinks.fromJson(json["cctvLinks"])
              : null);
}

class CctvLinks {
  String id;
  String cctvId;
  String channel;
  String link;
  String status;
  String lat;
  String ing;

  CctvLinks({
    required this.id,
    required this.cctvId,
    required this.channel,
    required this.link,
    required this.status,
    required this.lat,
    required this.ing,
  });

  factory CctvLinks.fromJson(Map<String, dynamic> json) => CctvLinks(
        id: json["id"],
        cctvId: json["cctv_id"],
        channel: json["channel"],
        link: json["link"],
        status: json["status"],
        lat: json["lat"],
        ing: json["ing"],
      );
}
