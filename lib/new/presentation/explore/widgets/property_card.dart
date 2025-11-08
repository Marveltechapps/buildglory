import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String location;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final String propertyType;
  final List<String> amenities;
  final bool isForSale;

  const PropertyCard({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.propertyType,
    required this.amenities,
    this.isForSale = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image with overlays
          Container(
            height: 168,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 11,
                  left: 11,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Text(
                      isForSale ? 'For Sale' : 'For Rent',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF1E2939),
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 11,
                  right: 11,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        heartgreyIcon,
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Property Details
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price and Property Type
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF102840),
                              fontFamily: 'Arial',
                              height: 2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4A5565),
                              fontFamily: 'Arial',
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        propertyType,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1A1A1A),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Location
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                // Property Features
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        bedrooms,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bathrooms,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        area,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Amenities
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: amenities.map((amenity) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F5),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Text(
                        amenity,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF030213),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
