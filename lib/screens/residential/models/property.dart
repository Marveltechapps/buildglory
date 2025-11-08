class Property {
  final String id;
  final String imageUrl;
  final String status;
  final String price;
  final String name;
  final String type;
  final String location;
  final int bedrooms;
  final int bathrooms;
  final int sqft;
  final String description;
  final String builtYear;
  final List<String> features;

  const Property({
    required this.id,
    required this.imageUrl,
    required this.status,
    required this.price,
    required this.name,
    required this.type,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.sqft,
    required this.description,
    required this.builtYear,
    required this.features,
  });
}

class PropertyFeature {
  final String name;
  final String iconUrl;

  const PropertyFeature({required this.name, required this.iconUrl});
}
