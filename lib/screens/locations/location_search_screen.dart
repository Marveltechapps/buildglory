import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/screens/locations/locationlist/pages/location_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSearchPage extends StatefulWidget {
  const LocationSearchPage({super.key});

  @override
  State<LocationSearchPage> createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildContent()),
              _buildBottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 42,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                          letterSpacing: -0.35,
                          height: 1.4,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const Text(
                        'Where are you looking?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6A7282),
                          height: 1,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LocationListScreen();
                  },
                ),
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    searchgreyIcon,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Search for city, area, or neighborhood',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1A1A),
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecentSearches(),
          const SizedBox(height: 16),
          _buildPopularLocations(),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent searches',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4A5565),
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 12),
        _buildLocationCard(
          iconUrl: timegreyIcon,
          iconBackgroundColor: const Color(0xFFF3F4F6),
          title: 'Chennai',
          subtitle: 'Tamil Nadu, India',
        ),
        const SizedBox(height: 8),
        _buildLocationCard(
          iconUrl: timegreyIcon,
          iconBackgroundColor: const Color(0xFFF3F4F6),
          title: 'Chennai',
          subtitle: 'Tamil Nadu, India',
        ),
      ],
    );
  }

  Widget _buildPopularLocations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular locations',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4A5565),
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 12),
        _buildLocationCard(
          iconUrl: locationblueIcon,
          iconBackgroundColor: const Color(0xFFDBEAFE),
          title: 'T. Nagar',
          subtitle: 'Chennai, Tamil Nadu, India',
          showPopularBadge: true,
        ),
        const SizedBox(height: 12),
        _buildLocationCard(
          iconUrl: locationblueIcon,
          iconBackgroundColor: const Color(0xFFDBEAFE),
          title: 'T. Nagar',
          subtitle: 'Chennai, Tamil Nadu, India',
          showPopularBadge: true,
        ),
      ],
    );
  }

  Widget _buildLocationCard({
    required String iconUrl,
    required Color iconBackgroundColor,
    required String title,
    required String subtitle,
    bool showPopularBadge = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconUrl,
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
          if (showPopularBadge)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFEDD4),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF54900),
                  height: 1,
                  fontFamily: 'Arial',
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF155DFC),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Next',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            ),
            const SizedBox(width: 16),
            Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/46eeba8559d6d9aef09fa4877fd6d8c30777ee28?placeholderIfAbsent=true',
              width: 14,
              height: 14,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
