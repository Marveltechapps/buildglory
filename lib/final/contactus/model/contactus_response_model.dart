import 'dart:convert';

ContactUsResponseModel contactUsResponseModelFromJson(String str) =>
    ContactUsResponseModel.fromJson(json.decode(str));

String contactUsResponseModelToJson(ContactUsResponseModel data) =>
    json.encode(data.toJson());

class ContactUsResponseModel {
  String? message;

  ContactUsResponseModel({this.message});

  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) =>
      ContactUsResponseModel(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}
