import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 228,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00A63E),
            Color(0xFF008236),
            Color(0xFF004F3B),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background elements
          Positioned(
            right: -27,
            top: -27,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            left: -13,
            bottom: -27,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.business_outlined,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),
                        const SizedBox(width: 10.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'DREAM HOME',
                              style: TextStyle(
                                color: Color(0xFFDCFCE7),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                height: 1.27,
                              ),
                            ),
                            const SizedBox(height: 3.5),
                            const Text(
                              'Find Your Match',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.46,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'AVG. TIME',
                          style: TextStyle(
                            color: Color(0xFFDCFCE7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            height: 1.27,
                          ),
                        ),
                        const SizedBox(height: 3.5),
                        const Text(
                          '15-30 days',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.46,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 21),
                const Text(
                  'Find Your Dream Property',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    height: 1.24,
                  ),
                ),
                const SizedBox(height: 1.25),
                const Text(
                  'Verified listings, trusted deals',
                  style: TextStyle(
                    color: Color(0xFFDCFCE7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.53,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.75),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Start Property Search',
                      style: TextStyle(
                        color: Color(0xFF008236),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.46,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
