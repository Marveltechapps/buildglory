import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepCard extends StatelessWidget {
  final String iconSvg;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconBackgroundColor;
  final String title;
  final String description;

  const StepCard({
    Key? key,
    required this.iconSvg,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon container
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: iconBackgroundColor,
            ),
            child: Center(
              child: SvgPicture.string(
                iconSvg,
                width: 21,
                height: 21,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Content container
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    height: 1.5,
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
