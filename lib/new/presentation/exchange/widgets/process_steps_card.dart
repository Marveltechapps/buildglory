import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProcessStepsCard extends StatelessWidget {
  const ProcessStepsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1A000000)),
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
                  timeIcon,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                const Text(
                  'What Happens Next?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    fontFamily: 'Arial',
                    height: 1.4,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Process Steps
            Column(
              children: [
                _buildProcessStep(
                  '1',
                  const Color(0xFFF3E8FF),
                  const Color(0xFF9810FA),
                  'Property Verification (48-72 hours)',
                  'Our team will verify your property details and legal documentation',
                ),
                const SizedBox(height: 12),
                _buildProcessStep(
                  '2',
                  const Color(0xFFDBEAFE),
                  const Color(0xFF155DFC),
                  'Network Matching',
                  'We\'ll match you with verified property owners interested in exchange',
                ),
                const SizedBox(height: 12),
                _buildProcessStep(
                  '3',
                  const Color(0xFFDCFCE7),
                  const Color(0xFF00A63E),
                  'Mutual Site Visits',
                  'We\'ll coordinate property viewings for both parties',
                ),
                const SizedBox(height: 12),
                _buildProcessStep(
                  '4',
                  const Color(0xFFFFEDD4),
                  const Color(0xFFF54900),
                  'Legal Exchange Process',
                  'Complete documentation and registration with our legal support',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessStep(
    String number,
    Color bgColor,
    Color textColor,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: 'Arial',
                height: 1.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A1A1A),
                  fontFamily: 'Arial',
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  fontFamily: 'Arial',
                  height: 1.27,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
