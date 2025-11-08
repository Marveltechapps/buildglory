import 'package:flutter/material.dart';

class PropertyConfigurationSection extends StatelessWidget {
  final String selectedBHKType;
  final String builtUpArea;
  final String carpetArea;
  final Function(String) onBHKTypeChanged;
  final Function(String) onBuiltUpAreaChanged;
  final Function(String) onCarpetAreaChanged;

  const PropertyConfigurationSection({
    Key? key,
    required this.selectedBHKType,
    required this.builtUpArea,
    required this.carpetArea,
    required this.onBHKTypeChanged,
    required this.onBuiltUpAreaChanged,
    required this.onCarpetAreaChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Configuration',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BHK Type',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  // Handle BHK type selection
                },
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFFF3F3F5),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedBHKType,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0A0A0A),
                          height: 1.0,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Built Up Area',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0A0A0A),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Stack(
                      children: [
                        Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xFFF3F3F5),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: Text(
                            builtUpArea,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF717182),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 7,
                          child: Text(
                            'sq ft',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6A7282),
                              height: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Carpet Area',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0A0A0A),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Stack(
                      children: [
                        Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xFFF3F3F5),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: Text(
                            carpetArea,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF717182),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 11,
                          top: 7,
                          child: Text(
                            'sq ft',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6A7282),
                              height: 1.0,
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
        ],
      ),
    );
  }
}
