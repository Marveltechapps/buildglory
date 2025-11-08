import 'package:flutter/material.dart';

class PropertyTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final Color backgroundColor;
  final Color borderColor;
  final Color buttonColor;

  const PropertyTypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.backgroundColor,
    required this.borderColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Image container
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.home, size: 28),
                );
              },
            ),
          ),

          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF101828),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Explore button
          Container(
            width: 68,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: buttonColor,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
