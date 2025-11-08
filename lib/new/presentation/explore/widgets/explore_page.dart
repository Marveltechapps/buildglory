import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'filter_dropdown.dart';
import 'property_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // constraints: const BoxConstraints(maxWidth: 377),
          child: Column(
            children: [
              // Header Section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    SizedBox(
                      width: double.infinity,
                      child: const Text(
                        'Explore Properties',
                        style: TextStyle(
                          fontSize: 21,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.42,
                          height: 1,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Search Bar
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            searchgreyIcon,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Search by location or address...',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1A1A1A),
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Filter Buttons
                    Row(
                      children: [
                        FilterDropdown(
                          label: 'All types',
                          onTap: () {
                            // Handle filter tap
                          },
                        ),
                        const SizedBox(width: 14),
                        FilterDropdown(
                          label: 'All Prices',
                          onTap: () {
                            // Handle filter tap
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Content Section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Results Count
                      const Text(
                        'Found 12 properties',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4A5565),
                          fontFamily: 'Arial',
                          height: 1,
                        ),
                      ),
                      // Property Cards List
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              PropertyCard(
                                imageUrl:
                                    'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/415f71c71fce34be14c1d1c38aa23f3fea3fcd8c',
                                price: '₹ 1.2 Crores',
                                title: 'Phoenix Meadows Villa',
                                location: 'OMR (IT Corridor), Chennai',
                                bedrooms: '4 bed',
                                bathrooms: '3 bath',
                                area: '2,850 sqft',
                                propertyType: 'Villa',
                                amenities: [
                                  'Modular Kitchen',
                                  'Marble Flooring',
                                  'Car Parking',
                                  '+1 more',
                                ],
                                isForSale: true,
                              ),
                              // Add more property cards here as needed
                            ],
                          ),
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
    );
  }
}
