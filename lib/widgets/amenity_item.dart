import 'package:flutter/material.dart';

class AmenityItem extends StatelessWidget {
  final IconData? icon;
  final String value;
  final String label;
  final bool isAcres;

  const AmenityItem({
    Key? key,
    this.icon,
    required this.value,
    required this.label,
    this.isAcres = false,
  }) : super(key: key);

  const AmenityItem.acres({
    Key? key,
    required this.value,
    required this.label,
  }) : icon = null, isAcres = true, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        gradient: const LinearGradient(
          colors: [Color(0xFFFAF5FF), Color(0xFFFDF2F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Icon
          Positioned(
            left: 22,
            top: 11,
            child: isAcres
                ? Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  )
                : Icon(
                    icon,
                    size: 18,
                    color: const Color(0xFF9810FA),
                  ),
          ),
          // Value
          Positioned(
            left: 11,
            top: 32,
            child: Container(
              width: 40,
              height: isAcres ? 35 : 18,
              alignment: Alignment.center,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0A0A0A),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Arial',
                  height: 1.46,
                ),
              ),
            ),
          ),
          // Label
          Positioned(
            left: isAcres ? 13 : 11,
            top: isAcres ? 67 : 49,
            child: Container(
              width: 40,
              height: 14,
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Arial',
                  height: 1.27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
