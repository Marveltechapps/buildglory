import 'package:flutter/material.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Container(
      width: isTablet ? double.infinity : 349,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: const Color(0xFFB9F8CF)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFF0FDF4), Color(0xFFECFDF5)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 14),
            _buildFeaturesGrid(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Why Choose Organic Homes?',
          style: TextStyle(
            color: Color(0xFF101828),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.53,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Building a sustainable future, one home at a time',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4A5565),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.46,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid(bool isMobile) {
    final features = [
      {
        'icon': Icons.wb_sunny_outlined,
        'iconColor': Color(0xFF009966),
        'title': 'Energy Efficient',
        'subtitle': 'Up to 90% savings',
      },
      {
        'icon': Icons.water_drop_outlined,
        'iconColor': Color(0xFF155DFC),
        'title': 'Water Conservation',
        'subtitle': 'Smart recycling',
      },
      {
        'icon': Icons.air_outlined,
        'iconColor': Color(0xFF00A63E),
        'title': 'Clean Air',
        'subtitle': 'Natural ventilation',
      },
      {
        'icon': Icons.battery_charging_full_outlined,
        'iconColor': Color(0xFF9810FA),
        'title': 'Self-Sustaining',
        'subtitle': 'Off-grid capable',
      },
    ];

    if (isMobile) {
      return Column(
        children: features.map((feature) =>
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildFeatureItem(feature),
          ),
        ).toList(),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 2.5,
      children: features.map((feature) => _buildFeatureItem(feature)).toList(),
    );
  }

  Widget _buildFeatureItem(Map<String, dynamic> feature) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.75),
          ),
          child: Icon(
            feature['icon'],
            size: 17.5,
            color: feature['iconColor'],
          ),
        ),
        const SizedBox(width: 10.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                feature['title'],
                style: const TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                  fontFamily: 'Arial',
                ),
              ),
              Text(
                feature['subtitle'],
                style: const TextStyle(
                  color: Color(0xFF4A5565),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.27,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
