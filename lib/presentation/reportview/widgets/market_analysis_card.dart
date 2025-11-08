import 'package:flutter/material.dart';

class MarketAnalysisCard extends StatelessWidget {
  const MarketAnalysisCard({Key? key}) : super(key: key);

  Widget _buildPriceBar(String year, String price, double percentage, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          SizedBox(
            width: 26,
            child: Text(
              year,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0A0A0A),
                fontFamily: 'Arial',
                height: 1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33554400),
                color: const Color(0xFFE5E7EB),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33554400),
                    color: isHighlighted ? const Color(0xFF00C950) : const Color(0xFF2B7FFF),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 37,
            child: Text(
              price,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w400,
                color: const Color(0xFF0A0A0A),
                fontFamily: 'Arial',
                height: 1,
              ),
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/0fd319ac62a4d5240f9a5911bab1d4c1f1e2db90?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                width: 18,
                height: 17,
              ),
              const SizedBox(width: 7),
              const Text(
                'Market Analysis',
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
          const Text(
            'Price Trends (Last 5 Years)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 11),
          Column(
            children: [
              _buildPriceBar('2020', '₹4,500', 0.45),
              _buildPriceBar('2021', '₹5,500', 0.55),
              _buildPriceBar('2022', '₹6,500', 0.65),
              _buildPriceBar('2023', '₹7,500', 0.75),
              _buildPriceBar('2024', '₹8,500', 0.85, isHighlighted: true),
            ],
          ),
          const SizedBox(height: 14),
          Stack(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xFFFAF5FF),
                ),
                padding: const EdgeInsets.all(11),
                child: Column(
                  children: [
                    Image.network(
                      'https://api.builder.io/api/v1/image/assets/TEMP/d7a9d85dd90209669453b1f0ef6dc0b43563c292?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                      width: 21,
                      height: 21,
                    ),
                    const Text(
                      '18.5%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF8200DB),
                        fontFamily: 'Arial',
                        height: 2,
                      ),
                    ),
                    const Text(
                      'Capital Appreciation',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9810FA),
                        fontFamily: 'Arial',
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 149,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFFFF7ED),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 11, 21, 11),
                  child: Column(
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/TEMP/03b9697e4c67d743925a213f6058eb0c57f40cef?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                        width: 21,
                        height: 21,
                      ),
                      const Text(
                        '3.8%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFCA3500),
                          fontFamily: 'Arial',
                          height: 2,
                        ),
                      ),
                      const Text(
                        'Rental Yield',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF54900),
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
    );
  }
}
