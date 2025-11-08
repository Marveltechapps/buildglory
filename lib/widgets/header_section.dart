import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 42),
              const Text(
                'Hey Ababa !',
                style: TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.36,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Find, Flip, Flourish',
                style: TextStyle(
                  color: Color(0xFF4A5565),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                Container(
                  width: 31.5,
                  height: 31.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.75),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Color(0xFF4A5565),
                    size: 14,
                  ),
                ),
                const SizedBox(width: 10.5),
                Container(
                  width: 31.5,
                  height: 31.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.75),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF4A5565),
                    size: 14,
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
