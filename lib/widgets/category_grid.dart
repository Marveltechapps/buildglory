import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Browse by Category',
            style: TextStyle(
              color: Color(0xFF101828),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.53,
            ),
          ),
          const SizedBox(height: 14),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 160 / 240,
            children: [
              _buildCategoryCard(
                backgroundColor: const Color(0xFFDBEAFE),
                icon: Icons.business_outlined,
                iconColor: const Color(0xFF155DFC),
                category: 'Apartments',
                listings: '1,200+ listings',
                buttonColor: const Color(0xFF155DFC),
              ),
              _buildCategoryCard(
                backgroundColor: const Color(0xFFDCFCE7),
                icon: Icons.home_outlined,
                iconColor: const Color(0xFF00A63E),
                category: 'Villas',
                listings: '800+ listings',
                buttonColor: const Color(0xFF00A63E),
              ),
              _buildCategoryCard(
                backgroundColor: const Color(0xFFF3E8FF),
                icon: Icons.business_outlined,
                iconColor: const Color(0xFF9810FA),
                category: 'Commercial',
                listings: '600+ listings',
                buttonColor: const Color(0xFF9810FA),
              ),
              _buildCategoryCard(
                backgroundColor: const Color(0xFFFFEDD4),
                icon: Icons.location_on_outlined,
                iconColor: const Color(0xFFF54900),
                category: 'Plots',
                listings: '400+ listings',
                buttonColor: const Color(0xFFF54900),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required Color backgroundColor,
    required IconData icon,
    required Color iconColor,
    required String category,
    required String listings,
    required Color buttonColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        color: backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 52,
            top: 15,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: backgroundColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 103,
            child: SizedBox(
              width: 130,
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 145,
            child: SizedBox(
              width: 130,
              child: Text(
                listings,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4A5565),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.27,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 190,
            child: Container(
              width: 130,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.75),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Explore',
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.46,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
