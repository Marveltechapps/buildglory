import 'package:flutter/material.dart';

class BenefitsListCard extends StatelessWidget {
  const BenefitsListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Why Property Exchange?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                fontFamily: 'Arial',
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            // Benefits List
            Column(
              children: [
                _buildBenefitItem('Save on brokerage fees (typically 1-2% of property value)'),
                const SizedBox(height: 7),
                _buildBenefitItem('Avoid lengthy sell-then-buy process'),
                const SizedBox(height: 7),
                _buildBenefitItem('Lower stamp duty compared to sale transactions'),
                const SizedBox(height: 7),
                _buildBenefitItem('Immediate property swap with verified owners'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: const Text(
            '•',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF155DFC),
              fontFamily: 'Arial',
              height: 1.0,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF364153),
              fontFamily: 'Arial',
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
