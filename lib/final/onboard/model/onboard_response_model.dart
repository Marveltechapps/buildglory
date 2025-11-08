import 'dart:convert';

List<OnboardResponseModel> onboardResponseModelFromJson(String str) =>
    List<OnboardResponseModel>.from(
      json.decode(str).map((x) => OnboardResponseModel.fromJson(x)),
    );

String onboardResponseModelToJson(List<OnboardResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnboardResponseModel {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  int? order;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  OnboardResponseModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.order,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OnboardResponseModel.fromJson(Map<String, dynamic> json) =>
      OnboardResponseModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        order: json["order"],
        isActive: json["isActive"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "order": order,
    "isActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
