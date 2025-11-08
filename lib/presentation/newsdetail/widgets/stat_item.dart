import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatItem extends StatelessWidget {
  final String iconSvg;
  final String value;
  final String label;

  const StatItem({
    Key? key,
    required this.iconSvg,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDEE6FF), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: SvgPicture.string(
                iconSvg,
                width: 21,
                height: 21,
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Value
          Container(
            height: 24.5,
            alignment: Alignment.center,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 24.5 / 18,
                fontFamily: 'Arial',
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Label
          Container(
            height: 14,
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 14 / 11,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
