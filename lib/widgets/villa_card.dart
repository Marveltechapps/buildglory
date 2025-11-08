import 'package:flutter/material.dart';
import 'amenity_item.dart';

class VillaCard extends StatelessWidget {
  const VillaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Section
          Container(
            height: 224,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.75),
                topRight: Radius.circular(12.75),
              ),
            ),
            child: Stack(
              children: [
                // Main Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.75),
                    topRight: Radius.circular(12.75),
                  ),
                  child: Image.network(
                    'https://api.builder.io/api/v1/image/assets/TEMP/e978963f1741e1de729330a0da73073b88884f6d?width=706',
                    width: double.infinity,
                    height: 224,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 224,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                // For Sale Badge
                Positioned(
                  left: 14,
                  top: 14,
                  child: Container(
                    height: 28,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      'For Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        height: 1.27,
                      ),
                    ),
                  ),
                ),
                // Heart Button
                Positioned(
                  right: 14,
                  top: 14,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Color(0xFF4A5565),
                    ),
                  ),
                ),
                // Luxury Badge
                Positioned(
                  left: 14,
                  bottom: 14,
                  child: Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFDC700), Color(0xFFD08700)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 3.5),
                        const Text(
                          'Luxury',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Arial',
                            height: 1.46,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content Section
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price and Type Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price and Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '₹1.2 Crores',
                            style: TextStyle(
                              color: Color(0xFF0A0A0A),
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Arial',
                              height: 1.33,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Phoenix Meadows Villa',
                            style: TextStyle(
                              color: Color(0xFF364153),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Villa Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF5FF),
                        borderRadius: BorderRadius.circular(6.75),
                        border: Border.all(
                          color: const Color(0xFFE9D4FF),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'Villa',
                        style: TextStyle(
                          color: Color(0xFF9810FA),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          height: 1.27,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Location Row
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF6A7282),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'OMR (IT Corridor), Chennai',
                      style: TextStyle(
                        color: Color(0xFF6A7282),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        height: 1.46,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Amenities Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 640) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: AmenityItem(icon: Icons.bed, value: '4', label: 'Beds')),
                              const SizedBox(width: 12),
                              Expanded(child: AmenityItem(icon: Icons.bathtub_outlined, value: '3', label: 'Baths')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: AmenityItem(icon: Icons.square_foot, value: '2,850', label: 'Sq ft')),
                              const SizedBox(width: 12),
                              Expanded(child: AmenityItem.acres(value: '0.25 acres', label: 'Acres')),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Expanded(child: AmenityItem(icon: Icons.bed, value: '4', label: 'Beds')),
                          const SizedBox(width: 14),
                          Expanded(child: AmenityItem(icon: Icons.bathtub_outlined, value: '3', label: 'Baths')),
                          const SizedBox(width: 14),
                          Expanded(child: AmenityItem(icon: Icons.square_foot, value: '2,850', label: 'Sq ft')),
                          const SizedBox(width: 14),
                          Expanded(child: AmenityItem.acres(value: '0.25 acres', label: 'Acres')),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                // Bottom Section
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF3F4F6),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'By',
                        style: TextStyle(
                          color: Color(0xFF6A7282),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          height: 1.27,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33554400),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: const Text(
                          'View Villa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            height: 1.46,
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
    );
  }
}
