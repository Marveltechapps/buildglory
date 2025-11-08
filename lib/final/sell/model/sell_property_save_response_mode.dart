import 'dart:convert';

SellPropertySaveResponseModel sellPropertySaveResponseModelFromJson(
  String str,
) => SellPropertySaveResponseModel.fromJson(json.decode(str));

String sellPropertySaveResponseModelToJson(
  SellPropertySaveResponseModel data,
) => json.encode(data.toJson());

class SellPropertySaveResponseModel {
  String? userId;
  String? advertisementType;
  String? propertyType;
  String? bhkType;
  int? builtUpArea;
  int? carpetArea;
  Location? location;
  int? price;
  bool? isNegotiable;
  String? ageOfConstruction;
  String? facing;
  String? ownership;
  String? furnishedStatus;
  List<String>? amenities;
  String? description;
  List<dynamic>? imageUrLs;
  String? locationMapLink;
  String? id;
  String? listingId;
  String? createdAt;
  int? v;

  SellPropertySaveResponseModel({
    this.userId,
    this.advertisementType,
    this.propertyType,
    this.bhkType,
    this.builtUpArea,
    this.carpetArea,
    this.location,
    this.price,
    this.isNegotiable,
    this.ageOfConstruction,
    this.facing,
    this.ownership,
    this.furnishedStatus,
    this.amenities,
    this.description,
    this.imageUrLs,
    this.locationMapLink,
    this.id,
    this.listingId,
    this.createdAt,
    this.v,
  });

  factory SellPropertySaveResponseModel.fromJson(Map<String, dynamic> json) =>
      SellPropertySaveResponseModel(
        userId: json["userId"],
        advertisementType: json["advertisementType"],
        propertyType: json["propertyType"],
        bhkType: json["bhkType"],
        builtUpArea: json["builtUpArea"],
        carpetArea: json["carpetArea"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        price: json["price"],
        isNegotiable: json["isNegotiable"],
        ageOfConstruction: json["ageOfConstruction"],
        facing: json["facing"],
        ownership: json["ownership"],
        furnishedStatus: json["furnishedStatus"],
        amenities: json["amenities"] == null
            ? []
            : List<String>.from(json["amenities"]!.map((x) => x)),
        description: json["description"],
        imageUrLs: json["imageURLs"] == null
            ? []
            : List<dynamic>.from(json["imageURLs"]!.map((x) => x)),
        locationMapLink: json["locationMapLink"],
        id: json["_id"],
        listingId: json["listingId"],
        createdAt: json["createdAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "advertisementType": advertisementType,
    "propertyType": propertyType,
    "bhkType": bhkType,
    "builtUpArea": builtUpArea,
    "carpetArea": carpetArea,
    "location": location?.toJson(),
    "price": price,
    "isNegotiable": isNegotiable,
    "ageOfConstruction": ageOfConstruction,
    "facing": facing,
    "ownership": ownership,
    "furnishedStatus": furnishedStatus,
    "amenities": amenities == null
        ? []
        : List<dynamic>.from(amenities!.map((x) => x)),
    "description": description,
    "imageURLs": imageUrLs == null
        ? []
        : List<dynamic>.from(imageUrLs!.map((x) => x)),
    "locationMapLink": locationMapLink,
    "_id": id,
    "listingId": listingId,
    "createdAt": createdAt,
    "__v": v,
  };
}

class Location {
  String? city;
  String? locality;
  String? projectName;

  Location({this.city, this.locality, this.projectName});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    locality: json["locality"],
    projectName: json["projectName"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "locality": locality,
    "projectName": projectName,
  };
}
