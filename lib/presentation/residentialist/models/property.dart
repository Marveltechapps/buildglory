class Property {
  final String id;
  final String price;
  final String name;
  final String location;
  final String imageUrl;
  final String propertyType;
  final int bedrooms;
  final int bathrooms;
  final String area;
  final double rating;
  final String status;
  final String agent;

  const Property({
    required this.id,
    required this.price,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.propertyType,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.rating,
    required this.status,
    required this.agent,
  });
}
