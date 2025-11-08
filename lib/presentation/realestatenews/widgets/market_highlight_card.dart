import 'package:flutter/material.dart';

class MarketHighlightCard extends StatelessWidget {
  final Widget icon;
  final String value;
  final Color valueColor;
  final String label;

  const MarketHighlightCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.valueColor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 640;

    return Container(
      height: isMobile ? 120 : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.10),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 15),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              height: 28 / 21,
              fontFamily: 'Arial',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF4A5565),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 14 / 11,
              fontFamily: 'Arial',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
