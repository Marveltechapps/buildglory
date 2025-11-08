import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String propertyImage;
  final String propertyName;
  final String location;
  final String price;
  final String bedrooms;
  final String area;
  final String availability;
  final VoidCallback? onHeartTap;
  final VoidCallback? onViewTap;

  const PropertyCard({
    Key? key,
    required this.propertyImage,
    required this.propertyName,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.area,
    required this.availability,
    this.onHeartTap,
    this.onViewTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 252),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0x00000000).withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: const Color(0x00000000).withOpacity(0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main content section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property image container
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF3F4F6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    propertyImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 70,
                        height: 70,
                        color: const Color(0xFFF3F4F6),
                        child: const Icon(
                          Icons.image,
                          color: Colors.grey,
                          size: 30,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Property details container
              Expanded(
                child: SizedBox(
                  height: 77,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Property name
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          propertyName,
                          style: const TextStyle(
                            color: Color(0xFF101828),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Location
                      Text(
                        location,
                        style: const TextStyle(
                          color: Color(0xFF4A5565),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Price and buttons container
                      SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            // Price
                            Expanded(
                              child: Text(
                                price,
                                style: const TextStyle(
                                  color: Color(0x0000A63E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  height: 1.5,
                                ),
                              ),
                            ),
                            // Buttons container
                            SizedBox(
                              width: 84,
                              child: Row(
                                children: [
                                  // Heart button
                                  GestureDetector(
                                    onTap: onHeartTap,
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/346fc04181336289846d3aafb524c049899d442e?placeholderIfAbsent=true',
                                          width: 14,
                                          height: 14,
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.favorite_border,
                                                  size: 14,
                                                  color: Colors.grey,
                                                );
                                              },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  // View button
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: onViewTap,
                                      child: Container(
                                        height: 28,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color(0xFF030213),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Arial',
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Bottom section with property details
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                // Bedrooms
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/12c415d17920a2ddf3e4191e4dfbb8280addbb43?placeholderIfAbsent=true',
                        width: 11,
                        height: 10,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.bed,
                            size: 11,
                            color: Color(0xFF6A7282),
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          bedrooms,
                          style: const TextStyle(
                            color: Color(0xFF6A7282),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Area
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/2b1f0c6ebe3413d80be1106114a20940e89996c6?placeholderIfAbsent=true',
                        width: 11,
                        height: 10,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.square_foot,
                            size: 11,
                            color: Color(0xFF6A7282),
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          area,
                          style: const TextStyle(
                            color: Color(0xFF6A7282),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Availability
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x0000C950),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          availability,
                          style: const TextStyle(
                            color: Color(0xFF6A7282),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage widget
class PropertyCardExample extends StatelessWidget {
  const PropertyCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Property Card Example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PropertyCard(
            propertyImage:
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/57cc9c68a57b7e82a6bcf7d4688e7e9953378485?placeholderIfAbsent=true',
            propertyName: 'Phoenix Meadows Villa',
            location: 'OMR (IT Corridor), Chennai',
            price: '₹1.2 Crores',
            bedrooms: '4 BR',
            area: '2850 sqft',
            availability: 'Available',
            onHeartTap: () {
              print('Heart tapped');
            },
            onViewTap: () {
              print('View tapped');
            },
          ),
        ),
      ),
    );
  }
}
