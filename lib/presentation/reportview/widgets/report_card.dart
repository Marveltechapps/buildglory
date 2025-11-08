import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/6f634a26c3ce2c5db5d4164b49875caa103383e6?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFFF3E8FF),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: const Text(
                    'Report',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8200DB),
                      fontFamily: 'Arial',
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Old Mahabalipuram road (OMR), Chennai - Evolving residential market of Chennai IT Corridor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
                    height: 1.5625,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://api.builder.io/api/v1/image/assets/TEMP/9711fd559b58394d7fb44c701d395b54cc56504d?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'March 15, 2024',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Row(
                      children: [
                        Image.network(
                          'https://api.builder.io/api/v1/image/assets/TEMP/cff74b8afc58b822bf0201c1822dd0b0ec79d79f?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '25 pages',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
