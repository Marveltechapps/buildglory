import 'dart:convert';

VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) =>
    VerifyOtpResponseModel.fromJson(json.decode(str));

String verifyOtpResponseModelToJson(VerifyOtpResponseModel data) =>
    json.encode(data.toJson());

class VerifyOtpResponseModel {
  String? message;
  String? userId;
  String? token;
  bool? isVerified;
  dynamic name;

  VerifyOtpResponseModel({
    this.message,
    this.userId,
    this.token,
    this.isVerified,
    this.name,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponseModel(
        message: json["message"],
        userId: json["userId"],
        token: json["token"],
        isVerified: json["isVerified"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userId": userId,
    "token": token,
    "isVerified": isVerified,
    "name": name,
  };
}
