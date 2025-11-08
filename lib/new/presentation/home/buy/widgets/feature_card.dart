import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconUrl;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconBackgroundColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconUrl,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: iconBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: Center(
              child: Image.network(
                iconUrl,
                width: 25,
                height: 25,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.check_circle,
                    size: 25,
                    color: Colors.white,
                  );
                },
              ),
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
                  description,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    height: 1.27,
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
