import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import '../widgets/location_info_card.dart';
import '../widgets/property_type_card.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            width: double.infinity,
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Property',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF1A1A1A),
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.35,
                                height: 1.4,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const Text(
                              'What type of property?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6A7282),
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Location Info Card
                        const LocationInfoCard(location: 'Chennai, Tamil Nadu'),

                        const SizedBox(height: 16),

                        // Property Type Cards
                        Expanded(
                          child: Column(
                            children: [
                              PropertyTypeCard(
                                imageUrl:
                                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/5122fe33b85fcf541e4e24d72f70b396d9373ffb?placeholderIfAbsent=true',
                                iconUrl: homeblackIcon,
                                title: 'Residential',
                                description:
                                    'Houses, apartments, and condos for living',
                                propertyCount: '1,247 properties',
                              ),

                              const SizedBox(height: 16),

                              PropertyTypeCard(
                                imageUrl:
                                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/5122fe33b85fcf541e4e24d72f70b396d9373ffb?placeholderIfAbsent=true',
                                iconUrl: apartmentblackIcon,
                                title: 'Commercial',
                                description:
                                    'Office buildings, retail spaces, and warehouses',
                                propertyCount: '1,247 properties',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Button
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF155DFC),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
