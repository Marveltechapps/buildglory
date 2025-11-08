import 'dart:convert';

SendOtpResponseModel sendOtpResponseModelFromJson(String str) =>
    SendOtpResponseModel.fromJson(json.decode(str));

String sendOtpResponseModelToJson(SendOtpResponseModel data) =>
    json.encode(data.toJson());

class SendOtpResponseModel {
  String? message;

  SendOtpResponseModel({this.message});

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      SendOtpResponseModel(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}
