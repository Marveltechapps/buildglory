import 'package:flutter/material.dart';

class PropertyFormHeader extends StatelessWidget {
  final VoidCallback onBackPressed;

  const PropertyFormHeader({Key? key, required this.onBackPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Container(
            height: 42,
            child: Row(
              children: [
                GestureDetector(
                  onTap: onBackPressed,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/dd5ba352da2e419c370ef61e6928f3c4c951daad?placeholderIfAbsent=true',
                        width: 14,
                        height: 14,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          child: const Text(
                            'Property Deta ils',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                              letterSpacing: -0.35,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const Text(
                          'Step 1 of 4',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33554400),
              color: const Color(0xFFE5E7EB),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      color: const Color(0xFF155DFC),
                    ),
                  ),
                ),
                const Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
