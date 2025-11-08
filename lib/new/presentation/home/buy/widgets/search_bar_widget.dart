import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF9FAFB),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 35,
            padding: const EdgeInsets.all(9),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/95df21c12bce7e43cd2e4822953d663820593fe2?placeholderIfAbsent=true',
              width: 17,
              height: 17,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.search, size: 17, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Search properties, locations, ...',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                fontFamily: 'Arial',
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
