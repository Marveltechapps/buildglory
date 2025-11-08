import 'package:flutter/material.dart';

class WhyListWithUs extends StatelessWidget {
  const WhyListWithUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 345),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Why List With Us?',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1A1A),
                      height: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Cards Grid
          Column(
            children: [
              // First row
              Row(
                children: [
                  Expanded(
                    child: _FeatureCard(
                      iconUrl:
                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c055b3a22e8f8b3bbb6c9cdbdc6fbba58a316831?placeholderIfAbsent=true',
                      title: 'Free Listing',
                      description: 'No charges for listing',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _FeatureCard(
                      iconUrl:
                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/f5fd726afa3852a570141677a0528bdf2714a74c?placeholderIfAbsent=true',
                      title: 'Expert Support',
                      description: 'Dedicated assistance',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Second row
              Row(
                children: [
                  Expanded(
                    child: _FeatureCard(
                      iconUrl:
                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/a3e64ce09084390f2b702182e11b9a9456d1ab48?placeholderIfAbsent=true',
                      title: 'Photo Quality',
                      description: 'Professional photos',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _FeatureCard(
                      iconUrl:
                          'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/6896fc97dc00a1a6e57f856d8c16d4fb0760e656?placeholderIfAbsent=true',
                      title: 'Quick Process',
                      description: 'Fast approval',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String description;

  const _FeatureCard({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      constraints: const BoxConstraints(minHeight: 146),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0x1A000000), // rgba(0, 0, 0, 0.1)
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Icon
          Center(
            child: Image.network(
              iconUrl,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.image, color: Colors.grey, size: 16),
                );
              },
            ),
          ),

          const SizedBox(height: 27),

          // Title
          Container(
            height: 18,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                height: 1.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          const SizedBox(height: 27),

          // Description
          Container(
            constraints: const BoxConstraints(minHeight: 14),
            child: Text(
              description,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A5565),
                height: 1.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
