import 'package:flutter/material.dart';

class RelatedArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;

  const RelatedArticleCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 640;

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.75),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          const SizedBox(width: 10.5),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Container(
                  height: 17.5,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 17.5 / 12,
                      fontFamily: 'Arial',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),

                // Description
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF4A5565),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 14 / 11,
                    fontFamily: 'Arial',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Date
                Container(
                  height: 14,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF155DFC),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 14 / 11,
                      fontFamily: 'Arial',
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
