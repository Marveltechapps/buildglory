import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String value;
  final String label;

  const StatisticItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF101828),
            fontFamily: 'Arial',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6A7282),
            height: 1.27,
            fontFamily: 'Arial',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
