import 'package:flutter/material.dart';
import 'villa_card.dart';

class VillaListPage extends StatelessWidget {
  const VillaListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            // Header Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFF3F4F6),
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Header Row
                    SizedBox(
                      height: 42,
                      child: Row(
                        children: [
                          // Back Button
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                              color: Color(0xFF0A0A0A),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Title and Subtitle
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Luxury Villas',
                                  style: TextStyle(
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Arial',
                                    height: 1.36,
                                  ),
                                ),
                                const Text(
                                  '4 villas available',
                                  style: TextStyle(
                                    color: Color(0xFF6A7282),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    height: 1.46,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Filter Button
                          Container(
                            width: 31.5,
                            height: 31.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.75),
                            ),
                            child: const Icon(
                              Icons.filter_list,
                              size: 14,
                              color: Color(0xFF0A0A0A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Search Input
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12.75),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.5, vertical: 3.5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 17.5,
                              color: Color(0xFF99A1AF),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Search luxury villas...',
                              style: TextStyle(
                                color: Color(0xFF717182),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const VillaCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
