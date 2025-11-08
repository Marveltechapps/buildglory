class PropertyLocation {
  final String country;
  final String state;
  final String city;
  final String locality;
  final String pincode;
  final String fullAddress;

  PropertyLocation({
    this.country = 'India',
    required this.state,
    required this.city,
    required this.locality,
    required this.pincode,
    required this.fullAddress,
  });

  factory PropertyLocation.fromJson(Map<String, dynamic> json) {
    return PropertyLocation(
      country: json['country'] as String? ?? 'India',
      state: json['state'] as String,
      city: json['city'] as String,
      locality: json['locality'] as String,
      pincode: json['pincode'] as String,
      fullAddress: json['fullAddress'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'state': state,
      'city': city,
      'locality': locality,
      'pincode': pincode,
      'fullAddress': fullAddress,
    };
  }
}

class MapCoordinates {
  final double lat;
  final double lng;

  MapCoordinates({
    required this.lat,
    required this.lng,
  });

  factory MapCoordinates.fromJson(Map<String, dynamic> json) {
    return MapCoordinates(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class PropertyLayout {
  final int bedrooms;
  final int bathrooms;

  PropertyLayout({
    required this.bedrooms,
    required this.bathrooms,
  });

  factory PropertyLayout.fromJson(Map<String, dynamic> json) {
    return PropertyLayout(
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
    };
  }
}

enum PropertyType {
  apartment('Apartment'),
  villa('Villa'),
  commercial('Commercial'),
  plot('Plot'),
  organicHome('OrganicHome');

  final String value;
  const PropertyType(this.value);

  static PropertyType fromString(String value) {
    return PropertyType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyType.apartment,
    );
  }
}

enum PropertySubtype {
  retail('Retail'),
  mixedUse('Mixed-Use'),
  office('Office'),
  land('Land'),
  residential('Residential'),
  agricultural('Agricultural'),
  commercial('Commercial');

  final String value;
  const PropertySubtype(this.value);

  static PropertySubtype fromString(String value) {
    return PropertySubtype.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertySubtype.residential,
    );
  }
}

class Property {
  final String? id;
  final String title;
  final PropertyType type;
  final PropertySubtype? subtype;
  final PropertyLocation location;
  final MapCoordinates? mapCoordinates;
  final double price;
  final String? image;
  final double? sqft;
  final String? about;
  final List<String>? amenities;
  final PropertyLayout? layout;
  final DateTime? createdAt;

  Property({
    this.id,
    required this.title,
    required this.type,
    this.subtype,
    required this.location,
    this.mapCoordinates,
    required this.price,
    this.image,
    this.sqft,
    this.about,
    this.amenities,
    this.layout,
    this.createdAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['_id'] as String?,
      title: json['title'] as String,
      type: PropertyType.fromString(json['type'] as String),
      subtype: json['subtype'] != null 
          ? PropertySubtype.fromString(json['subtype'] as String)
          : null,
      location: PropertyLocation.fromJson(json['location'] as Map<String, dynamic>),
      mapCoordinates: json['mapCoordinates'] != null
          ? MapCoordinates.fromJson(json['mapCoordinates'] as Map<String, dynamic>)
          : null,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
      sqft: json['sqft'] != null ? (json['sqft'] as num).toDouble() : null,
      about: json['about'] as String?,
      amenities: json['amenities'] != null
          ? List<String>.from(json['amenities'] as List)
          : null,
      layout: json['layout'] != null
          ? PropertyLayout.fromJson(json['layout'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'title': title,
      'type': type.value,
      if (subtype != null) 'subtype': subtype!.value,
      'location': location.toJson(),
      if (mapCoordinates != null) 'mapCoordinates': mapCoordinates!.toJson(),
      'price': price,
      if (image != null) 'image': image,
      if (sqft != null) 'sqft': sqft,
      if (about != null) 'about': about,
      if (amenities != null) 'amenities': amenities,
      if (layout != null) 'layout': layout!.toJson(),
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }

  Property copyWith({
    String? id,
    String? title,
    PropertyType? type,
    PropertySubtype? subtype,
    PropertyLocation? location,
    MapCoordinates? mapCoordinates,
    double? price,
    String? image,
    double? sqft,
    String? about,
    List<String>? amenities,
    PropertyLayout? layout,
    DateTime? createdAt,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      subtype: subtype ?? this.subtype,
      location: location ?? this.location,
      mapCoordinates: mapCoordinates ?? this.mapCoordinates,
      price: price ?? this.price,
      image: image ?? this.image,
      sqft: sqft ?? this.sqft,
      about: about ?? this.about,
      amenities: amenities ?? this.amenities,
      layout: layout ?? this.layout,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

