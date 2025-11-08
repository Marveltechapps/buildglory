import 'package:flutter/material.dart';

class InvestmentOutlookCard extends StatelessWidget {
  const InvestmentOutlookCard({Key? key}) : super(key: key);

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF008236),
          fontFamily: 'Arial',
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildConsiderationItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA65F00),
          fontFamily: 'Arial',
          height: 1.5,
        ),
      ),
    );
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/3b40f951075325e35e517828d552af7d5cbbcc9a?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 12),
              const Text(
                'Investment Outlook',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  fontFamily: 'Arial',
                  height: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: const Color(0xFFB9F8CF)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Positive Indicators',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF016630),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildListItem('• Consistent demand from IT professionals'),
                    _buildListItem('• Infrastructure development projects underway'),
                    _buildListItem('• Metro Phase 2 expansion planned'),
                    _buildListItem('• Growing rental market'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: const Color(0xFFFFF085)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Considerations',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF894B00),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildConsiderationItem('• Higher price points compared to outer suburbs'),
                    _buildConsiderationItem('• Traffic congestion during peak hours'),
                    _buildConsiderationItem('• Monsoon-related flooding in some areas'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: const Color(0xFFBEDBFF)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Future Projections',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF193CB8),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      width: 138,
                      child: Column(
                        children: const [
                          Text(
                            '12-15%',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1447E6),
                              fontFamily: 'Arial',
                              height: 1.33,
                            ),
                          ),
                          Text(
                            'Expected Annual Growth',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF155DFC),
                              fontFamily: 'Arial',
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 137,
                        child: Column(
                          children: const [
                            Text(
                              '₹12K',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1447E6),
                                fontFamily: 'Arial',
                                height: 1.33,
                              ),
                            ),
                            Text(
                              'Projected Price/sqft (2026)',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF155DFC),
                                fontFamily: 'Arial',
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
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
