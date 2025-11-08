import 'package:flutter/material.dart';

class HeroStatsCard extends StatelessWidget {
  const HeroStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Container(
      width: isTablet ? double.infinity : 349,
      // height: 149,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: const Color(0x1A000000)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF00BC7D), Color(0xFF00A63E)],
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: isMobile ? 16 : 21,
          right: isMobile ? 16 : 21,
          top: 21,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 14),
            _buildStatsSection(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0x33FFFFFF),
          ),
          child: const Icon(Icons.eco, size: 21, color: Colors.white),
        ),
        const SizedBox(width: 10.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sustainable Living',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.53,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 3.5),
              const Text(
                'Eco-friendly homes for a better tomorrow',
                style: TextStyle(
                  color: Color(0xFFD0FAE5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(bool isMobile) {
    if (isMobile) {
      return Row(
        children: [
          _buildStatItem('3', 'Eco Homes'),
          const SizedBox(height: 8),
          _buildStatItem('90%', 'Energy Savings'),
          const SizedBox(height: 8),
          _buildStatItem('100%', 'Certified Green'),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatItem('3', 'Eco Homes'),
        _buildStatItem('90%', 'Energy Savings'),
        _buildStatItem('100%', 'Certified Green'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 3.5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFD0FAE5),
            fontSize: 11,
            fontWeight: FontWeight.w400,
            height: 1.27,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }
}
