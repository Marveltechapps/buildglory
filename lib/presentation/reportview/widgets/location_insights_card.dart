import 'package:flutter/material.dart';

class LocationInsightsCard extends StatelessWidget {
  const LocationInsightsCard({Key? key}) : super(key: key);

  Widget _buildInsightItem(String iconUrl, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: const Color(0xFFF9FAFB),
      ),
      padding: const EdgeInsets.all(11),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            iconUrl,
            width: 12,
            height: 12,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
                    height: 1,
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
                'https://api.builder.io/api/v1/image/assets/TEMP/fd3d690ed67ef25b2557ad659d6b120c6e253bc3?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                width: 18,
                height: 17,
              ),
              const SizedBox(width: 7),
              const Text(
                'Location Insights',
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
          Column(
            children: [
              _buildInsightItem(
                'https://api.builder.io/api/v1/image/assets/TEMP/507b8b84bb3b5aebcaf294e1f5014ee955ee18b9?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                'IT Corridor Proximity',
                'Major IT companies within 5km radius including TCS, Infosys, Wipro, and Cognizant',
              ),
              _buildInsightItem(
                'https://api.builder.io/api/v1/image/assets/TEMP/26f151f29c2f5c30ecc41fed347447bc1c45f4da?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                'Transportation Hub',
                'Metro connectivity, bus routes, and proximity to Chennai International Airport',
              ),
              _buildInsightItem(
                'https://api.builder.io/api/v1/image/assets/TEMP/1f4417b5e6f2ff5e015a9f8b8c3cd2e5f060cde7?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                'Social Infrastructure',
                'Top-tier schools, hospitals, shopping malls, and entertainment centers',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
