class RegisterResponseModel {
  bool succes;
  String message;

  RegisterResponseModel({
    required this.succes,
    required this.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        succes: json["succes"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "succes": succes,
        "message": message,
      };
}
