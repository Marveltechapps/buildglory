enum AdvertisementType {
  sale('Sale'),
  rentLease('Rent/Lease');

  final String value;
  const AdvertisementType(this.value);

  static AdvertisementType fromString(String value) {
    return AdvertisementType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AdvertisementType.sale,
    );
  }
}

enum SellPropertyType {
  apartment('Apartment'),
  independentHouse('Independent House'),
  villa('Villa'),
  plotLand('Plot/Land');

  final String value;
  const SellPropertyType(this.value);

  static SellPropertyType fromString(String value) {
    return SellPropertyType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SellPropertyType.apartment,
    );
  }
}

class SellLocation {
  final String city;
  final String locality;
  final String? projectName;

  SellLocation({
    required this.city,
    required this.locality,
    this.projectName,
  });

  factory SellLocation.fromJson(Map<String, dynamic> json) {
    return SellLocation(
      city: json['city'] as String,
      locality: json['locality'] as String,
      projectName: json['projectName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'locality': locality,
      if (projectName != null) 'projectName': projectName,
    };
  }
}

class Sell {
  final String? id;
  final String? listingId;
  final String? userId;
  final AdvertisementType advertisementType;
  final SellPropertyType propertyType;
  final String bhkType;
  final double builtUpArea;
  final double? carpetArea;
  final SellLocation location;
  final double price;
  final bool isNegotiable;
  final String? ageOfConstruction;
  final String? facing;
  final String? ownership;
  final String? furnishedStatus;
  final List<String>? amenities;
  final String? description;
  final List<String>? imageURLs;
  final String? locationMapLink;
  final DateTime? createdAt;

  Sell({
    this.id,
    this.listingId,
    this.userId,
    required this.advertisementType,
    required this.propertyType,
    required this.bhkType,
    required this.builtUpArea,
    this.carpetArea,
    required this.location,
    required this.price,
    this.isNegotiable = false,
    this.ageOfConstruction,
    this.facing,
    this.ownership,
    this.furnishedStatus,
    this.amenities,
    this.description,
    this.imageURLs,
    this.locationMapLink,
    this.createdAt,
  });

  factory Sell.fromJson(Map<String, dynamic> json) {
    return Sell(
      id: json['_id'] as String?,
      listingId: json['listingId'] as String?,
      userId: json['userId'] as String?,
      advertisementType: AdvertisementType.fromString(json['advertisementType'] as String),
      propertyType: SellPropertyType.fromString(json['propertyType'] as String),
      bhkType: json['bhkType'] as String,
      builtUpArea: (json['builtUpArea'] as num).toDouble(),
      carpetArea: json['carpetArea'] != null 
          ? (json['carpetArea'] as num).toDouble()
          : null,
      location: SellLocation.fromJson(json['location'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      isNegotiable: json['isNegotiable'] as bool? ?? false,
      ageOfConstruction: json['ageOfConstruction'] as String?,
      facing: json['facing'] as String?,
      ownership: json['ownership'] as String?,
      furnishedStatus: json['furnishedStatus'] as String?,
      amenities: json['amenities'] != null
          ? List<String>.from(json['amenities'] as List)
          : null,
      description: json['description'] as String?,
      imageURLs: json['imageURLs'] != null
          ? List<String>.from(json['imageURLs'] as List)
          : null,
      locationMapLink: json['locationMapLink'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (listingId != null) 'listingId': listingId,
      if (userId != null) 'userId': userId,
      'advertisementType': advertisementType.value,
      'propertyType': propertyType.value,
      'bhkType': bhkType,
      'builtUpArea': builtUpArea,
      if (carpetArea != null) 'carpetArea': carpetArea,
      'location': location.toJson(),
      'price': price,
      'isNegotiable': isNegotiable,
      if (ageOfConstruction != null) 'ageOfConstruction': ageOfConstruction,
      if (facing != null) 'facing': facing,
      if (ownership != null) 'ownership': ownership,
      if (furnishedStatus != null) 'furnishedStatus': furnishedStatus,
      if (amenities != null) 'amenities': amenities,
      if (description != null) 'description': description,
      if (imageURLs != null) 'imageURLs': imageURLs,
      if (locationMapLink != null) 'locationMapLink': locationMapLink,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }
}

