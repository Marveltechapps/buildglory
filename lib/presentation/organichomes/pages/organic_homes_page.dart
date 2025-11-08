import 'package:flutter/material.dart';
import '../widgets/hero_stats_card.dart';
import '../widgets/property_card.dart';
import '../widgets/feature_grid.dart';
import '../widgets/filter_buttons.dart';

class OrganicHomesPage extends StatefulWidget {
  const OrganicHomesPage({super.key});

  @override
  State<OrganicHomesPage> createState() => _OrganicHomesPageState();
}

class _OrganicHomesPageState extends State<OrganicHomesPage> {
  String selectedFilter = 'All Homes (3)';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640 && screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: isMobile ? double.infinity : (isTablet ? 600 : 377),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 8 : (isTablet ? 16 : 0),
            ),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                const HeroStatsCard(),
                const SizedBox(height: 16),
                _buildSearchSection(),
                const SizedBox(height: 16),
                _buildPropertySection(),
                const SizedBox(height: 16),
                const FeatureGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isMobile = MediaQuery.of(context).size.width <= 640;

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFECFDF5), Color(0xFFF0FDF4)],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 31.5,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.75),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 14,
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 88),
                  child: const Text(
                    'Organic Homes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.53,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                const SizedBox(height: 3.5),
                const Text(
                  'Sustainable Living Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4A5565),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.27,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 31.5),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    final isMobile = MediaQuery.of(context).size.width <= 640;
    final isTablet = MediaQuery.of(context).size.width <= 991;

    return Container(
      padding: EdgeInsets.all(isTablet ? 12 : 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.75),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 11, right: 10),
                        child: Icon(
                          Icons.search,
                          size: 14,
                          color: Color(0xFF99A1AF),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search sustainable homes...',
                            hintStyle: TextStyle(
                              color: Color(0x800A0A0A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  // Handle filter tap
                },
                child: Container(
                  width: 34,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.75),
                    border: Border.all(color: const Color(0x1A000000)),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.tune,
                    size: 14,
                    color: Color(0xFF0A0A0A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilterButtons(
            selectedFilter: selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                selectedFilter = filter;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPropertySection() {
    final isTablet = MediaQuery.of(context).size.width <= 991;

    return Container(
      padding: EdgeInsets.all(isTablet ? 12 : 16),
      child: const PropertyCard(),
    );
  }
}
