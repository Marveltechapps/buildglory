import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BenefitsCard extends StatelessWidget {
  const BenefitsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD4E7FF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                SvgPicture.asset(
                  exchangeIcon,
                  color: Colors.purple,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Verified Exchange Network Benefits',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1A1A),
                      fontFamily: 'Arial',
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Benefits List
            Column(
              children: [
                _buildBenefitItem(
                  homeIcon,
                  '100% Verified Properties',
                  'All properties in our exchange network are legally verified',
                ),
                const SizedBox(height: 8),
                _buildBenefitItem(
                  homeIcon,
                  'Legal Documentation Support',
                  'Complete assistance with exchange deeds and paperwork',
                ),
                const SizedBox(height: 8),
                _buildBenefitItem(
                  homeIcon,
                  'Fair Market Valuation',
                  'Professional property assessment for equitable exchanges',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String iconUrl, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(iconUrl, width: 18, height: 18, fit: BoxFit.contain),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A1A1A),
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  fontFamily: 'Arial',
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
