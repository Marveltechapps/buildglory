import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureCard extends StatelessWidget {
  final String iconSvg;
  final Color backgroundColor;
  final String title;
  final String subtitle;

  const FeatureCard({
    Key? key,
    required this.iconSvg,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Icon container
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: backgroundColor,
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
          const SizedBox(height: 24),
          // Title
          Container(
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                height: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Subtitle
          Container(
            width: double.infinity,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A5565),
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
