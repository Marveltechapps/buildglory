import 'dart:convert';

List<PropertyListResponseModel> propertyListResponseModelFromJson(String str) =>
    List<PropertyListResponseModel>.from(
      json.decode(str).map((x) => PropertyListResponseModel.fromJson(x)),
    );

String propertyListResponseModelToJson(List<PropertyListResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyListResponseModel {
  Location? location;
  Layout? layout;
  String? id;
  String? title;
  String? type;
  int? price;
  String? image;
  int? sqft;
  String? about;
  List<String>? amenities;
  String? createdAt;
  int? v;

  PropertyListResponseModel({
    this.location,
    this.layout,
    this.id,
    this.title,
    this.type,
    this.price,
    this.image,
    this.sqft,
    this.about,
    this.amenities,
    this.createdAt,
    this.v,
  });

  factory PropertyListResponseModel.fromJson(Map<String, dynamic> json) =>
      PropertyListResponseModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        layout: json["layout"] == null ? null : Layout.fromJson(json["layout"]),
        id: json["_id"],
        title: json["title"],
        type: json["type"],
        price: json["price"],
        image: json["image"],
        sqft: json["sqft"],
        about: json["about"],
        amenities: json["amenities"] == null
            ? []
            : List<String>.from(json["amenities"]!.map((x) => x)),
        createdAt: json["createdAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "layout": layout?.toJson(),
    "_id": id,
    "title": title,
    "type": type,
    "price": price,
    "image": image,
    "sqft": sqft,
    "about": about,
    "amenities": amenities == null
        ? []
        : List<dynamic>.from(amenities!.map((x) => x)),
    "createdAt": createdAt,
    "__v": v,
  };
}

class Layout {
  int? bedrooms;
  int? bathrooms;

  Layout({this.bedrooms, this.bathrooms});

  factory Layout.fromJson(Map<String, dynamic> json) =>
      Layout(bedrooms: json["bedrooms"], bathrooms: json["bathrooms"]);

  Map<String, dynamic> toJson() => {
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
  };
}

class Location {
  String? country;
  String? state;
  String? city;
  String? locality;
  String? pincode;
  String? fullAddress;

  Location({
    this.country,
    this.state,
    this.city,
    this.locality,
    this.pincode,
    this.fullAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    country: json["country"],
    state: json["state"],
    city: json["city"],
    locality: json["locality"],
    pincode: json["pincode"],
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "state": state,
    "city": city,
    "locality": locality,
    "pincode": pincode,
    "fullAddress": fullAddress,
  };
}
