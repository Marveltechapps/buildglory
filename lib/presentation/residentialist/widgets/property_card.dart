import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onViewDetails;
  final VoidCallback? onFavorite;

  const PropertyCard({
    Key? key,
    required this.property,
    this.onViewDetails,
    this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildImageSection(),
          _buildContentSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
            ),
            child: Image.network(
              property.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF155DFC),
                        borderRadius: BorderRadius.circular(33554400),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      child: Text(
                        property.status,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onFavorite,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(33554400),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.network(
                            'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/274a52c06621c17315164c5cdb7df05699f574b0?placeholderIfAbsent=true',
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(33554400),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/08f1df7a311daa4d93522a20597882d5e0054a1e?placeholderIfAbsent=true',
                          width: 10,
                          height: 11,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          property.rating.toString(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0A0A0A),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0A0A0A),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      property.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Text(
                  property.propertyType,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/333aefda7e8a46645caad82aea8b089dbff4e16b?placeholderIfAbsent=true',
                width: 14,
                height: 14,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  property.location,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              _buildFeatureItem(
                'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/d27b645f0fa6739a311b54746f093ff62af6352d?placeholderIfAbsent=true',
                '${property.bedrooms} Bed',
              ),
              const SizedBox(width: 21),
              _buildFeatureItem(
                'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/fd1f7a9be1cd422df2d12f11b0e762313ada7ce4?placeholderIfAbsent=true',
                '${property.bathrooms} Bath',
              ),
              const SizedBox(width: 21),
              _buildFeatureItem(
                'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/ca5621fd05c67ae00836207a877674cf2158c144?placeholderIfAbsent=true',
                property.area,
              ),
            ],
          ),
          const SizedBox(height: 13),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFF3F4F6),
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'By',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                  ),
                ),
                GestureDetector(
                  onTap: onViewDetails,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF155DFC),
                      borderRadius: BorderRadius.circular(33554400),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String iconUrl, String text) {
    return Row(
      children: [
        Image.network(
          iconUrl,
          width: 14,
          height: 14,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4A5565),
            height: 1,
          ),
        ),
      ],
    );
  }
}
