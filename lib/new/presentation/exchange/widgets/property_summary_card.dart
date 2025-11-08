import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PropertySummaryCard extends StatelessWidget {
  const PropertySummaryCard({Key? key}) : super(key: key);

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
                  homeblueIcon,
                  width: 18,
                  height: 17,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Property Summary',
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

            const SizedBox(height: 12),

            // Property Details
            Column(
              children: [
                _buildPropertyRow('Property Type:', 'apartment'),
                const SizedBox(height: 11),
                _buildPropertyRow('Configuration:', '2BHK'),
                const SizedBox(height: 11),
                _buildPropertyRow('Location:', 'SDF, bangalore'),
                const SizedBox(height: 11),
                _buildPropertyRowWithColor(
                  'Expected Price:',
                  '₹66',
                  const Color(0xFF00A63E),
                ),
                const SizedBox(height: 11),
                _buildPropertyRow('Owner:', 'R6U'),
                const SizedBox(height: 11),
                _buildPropertyRow('Contact:', ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              fontFamily: 'Arial',
              height: 1.0,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1A1A1A),
            fontFamily: 'Arial',
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyRowWithColor(
    String label,
    String value,
    Color valueColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              fontFamily: 'Arial',
              height: 1.0,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: valueColor,
            fontFamily: 'Arial',
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
