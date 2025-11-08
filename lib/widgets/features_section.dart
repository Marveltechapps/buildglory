import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                'Why Choose Build Glory?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.53,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Your trusted property buying partner',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          Column(
            children: [
              _buildFeatureItem(
                gradient: const LinearGradient(
                  colors: [Color(0xFF05DF72), Color(0xFF00BC7D)],
                ),
                icon: Icons.security,
                title: '100% Verified Properties',
                description: 'Every property verified for legal clearance and authenticity',
              ),
              const SizedBox(height: 14),
              _buildFeatureItem(
                gradient: const LinearGradient(
                  colors: [Color(0xFF51A2FF), Color(0xFF615FFF)],
                ),
                icon: Icons.search,
                title: 'Smart Property Matching',
                description: 'AI-powered recommendations based on your preferences',
              ),
              const SizedBox(height: 14),
              _buildFeatureItem(
                gradient: const LinearGradient(
                  colors: [Color(0xFFC27AFF), Color(0xFF8E51FF)],
                ),
                icon: Icons.person,
                title: 'Expert Buying Support',
                description: 'Dedicated assistance from search to final registration',
              ),
            ],
          ),
          const SizedBox(height: 21),
          Container(
            height: 57,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem('8000+', 'Happy Buyers'),
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE5E7EB),
                ),
                _buildStatItem('95%', 'Satisfaction Rate'),
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE5E7EB),
                ),
                _buildStatItem('4.8★', 'User Rating'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required Gradient gradient,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      height: 79,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24.5,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF101828),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.46,
                  ),
                ),
                const SizedBox(height: 3.5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF4A5565),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.27,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF101828),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.46,
          ),
        ),
        const SizedBox(height: 3.5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF6A7282),
            fontSize: 11,
            fontWeight: FontWeight.w400,
            height: 1.27,
          ),
        ),
      ],
    );
  }
}
