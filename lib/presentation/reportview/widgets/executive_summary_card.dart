import 'package:flutter/material.dart';

class ExecutiveSummaryCard extends StatelessWidget {
  const ExecutiveSummaryCard({Key? key}) : super(key: key);

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
                'https://api.builder.io/api/v1/image/assets/TEMP/56af1c932ec97f74065e71aba4a2da5e126e018b?placeholderIfAbsent=true&apiKey=06096b941d4746ae854b71463e363371',
                width: 18,
                height: 17,
              ),
              const SizedBox(width: 8),
              const Text(
                'Executive Summary',
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
          const SizedBox(height: 12),
          const Text(
            'Old Mahabalipuram road (OMR) has emerged as a significant residential market within Chennai\'s IT Corridor. This comprehensive analysis covers market trends, price movements, and future prospects for residential development in this prime location.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF364153),
              fontFamily: 'Arial',
              height: 1.67,
            ),
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xFFEFF6FF),
                ),
                padding: const EdgeInsets.fromLTRB(11, 11, 11, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Market Growth',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1C398E),
                        fontFamily: 'Arial',
                        height: 1,
                      ),
                    ),
                    Text(
                      '15.2%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1447E6),
                        fontFamily: 'Arial',
                        height: 1.4,
                      ),
                    ),
                    Text(
                      'Year over Year',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF155DFC),
                        fontFamily: 'Arial',
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 11),
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
                    color: const Color(0xFFF0FDF4),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 11, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Avg. Price',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D542B),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                      Text(
                        '₹8,500',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF008236),
                          fontFamily: 'Arial',
                          height: 1.4,
                        ),
                      ),
                      Text(
                        'Per sq ft',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF00A63E),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 11),
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
