import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyTypeCard extends StatelessWidget {
  final String imageUrl;
  final String iconUrl;
  final String title;
  final String description;
  final String propertyCount;

  const PropertyTypeCard({
    super.key,
    required this.imageUrl,
    required this.iconUrl,
    required this.title,
    required this.description,
    required this.propertyCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 112,
            height: 126,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.network(imageUrl, fit: BoxFit.cover, width: 112),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xFFF3F4F6),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 21,
                                height: 21,
                                child: SvgPicture.asset(
                                  iconUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF101828),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    propertyCount,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6A7282),
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
