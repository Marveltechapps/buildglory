import 'package:flutter/material.dart';

class ProcessSteps extends StatelessWidget {
  const ProcessSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                'Property Buying in 4 Steps',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.36,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Simple process to find your dream home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 142,
            child: Stack(
              children: [
                Positioned(
                  left: 28,
                  top: 21,
                  child: Container(
                    width: 278,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF00C950),
                          Color(0xFFAD46FF),
                          Color(0xFFFF6900),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepItem(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00C950), Color(0xFF00A63E)],
                      ),
                      icon: Icons.search,
                      step: 'STEP 1',
                      title: 'Search Properties',
                      description: 'Browse verified listings',
                      stepColor: const Color(0xFF00A63E),
                    ),
                    _buildStepItem(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2B7FFF), Color(0xFF155DFC)],
                      ),
                      icon: Icons.favorite_outline,
                      step: 'STEP 2',
                      title: 'Shortlist & Visit',
                      description: 'Save favorites and schedule visits',
                      stepColor: const Color(0xFF155DFC),
                    ),
                    _buildStepItem(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFAD46FF), Color(0xFF9810FA)],
                      ),
                      icon: Icons.calculate_outlined,
                      step: 'STEP 3',
                      title: 'Price & Negotiate',
                      description: 'Get market price insights',
                      stepColor: const Color(0xFF9810FA),
                    ),
                    _buildStepItem(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6900), Color(0xFFF54900)],
                      ),
                      icon: Icons.check_circle_outline,
                      step: 'STEP 4',
                      title: 'Finalize Deal',
                      description: 'Complete legal formalities',
                      stepColor: const Color(0xFFF54900),
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

  Widget _buildStepItem({
    required Gradient gradient,
    required IconData icon,
    required String step,
    required String title,
    required String description,
    required Color stepColor,
  }) {
    return SizedBox(
      width: 83.5,
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient,
              border: Border.all(color: Colors.white, width: 4),
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
            child: Icon(
              icon,
              color: Colors.white,
              size: 21,
            ),
          ),
          const SizedBox(height: 11),
          Column(
            children: [
              Text(
                step,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: stepColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.27,
                ),
              ),
              const SizedBox(height: 3.5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.27,
                ),
              ),
              const SizedBox(height: 3.5),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
