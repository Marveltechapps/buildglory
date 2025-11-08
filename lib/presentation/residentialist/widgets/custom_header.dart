import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF3F4F6),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onBackPressed,
                child: Image.network(
                  'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/c4eaf7f8f0dca31193882e8d82d6f8c6be87f844?placeholderIfAbsent=true',
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0A0A0A),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6A7282),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onMenuPressed,
                child: Image.network(
                  'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/35ebd68a24d505f5b75641a95021a07553c7508f?placeholderIfAbsent=true',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
            child: Row(
              children: [
                Image.network(
                  'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/a27ddd3ee9d3c43f8b85fce995bd79803708ef2a?placeholderIfAbsent=true',
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Search residential properties...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                    ),
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
