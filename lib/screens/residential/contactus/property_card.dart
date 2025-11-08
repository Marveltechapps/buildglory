import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        children: [
          // Property Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/feb6f1ffed4c9f94c3c6361be5f92b841b6c682e?placeholderIfAbsent=true',
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Property Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Title
                const Text(
                  'Phoenix Meadows Villa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    fontFamily: 'Arial',
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                // Location
                Row(
                  children: [
                    SvgPicture.asset(locationgreyIcon, width: 14, height: 14),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'OMR (IT Corridor), Chennai',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Price
                const Text(
                  '₹1.2 Crores',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF155DFC),
                    fontFamily: 'Arial',
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
