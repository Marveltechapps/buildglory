import 'package:flutter/material.dart';

class VillaDetailsPage extends StatelessWidget {
  const VillaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640 && screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: isMobile ? double.infinity : (isTablet ? 768 : 377),
            margin: isTablet ? const EdgeInsets.symmetric(horizontal: 0) : null,
            child: Column(
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 17.5,
                    vertical: isMobile ? 12 : 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                    ),
                  ),
                  child: SizedBox(
                    height: isMobile ? 32 : 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button
                        Container(
                          width: isMobile ? 32 : 35,
                          height: isMobile ? 32 : 35,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF0A0A0A),
                              size: 14,
                            ),
                          ),
                        ),
                        // Title
                        Text(
                          'Villa Details',
                          style: TextStyle(
                            color: const Color(0xFF0A0A0A),
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Arial',
                            height: isMobile ? 20 / 14 : 24.5 / 16,
                          ),
                        ),
                        // Action Buttons
                        Row(
                          children: [
                            Container(
                              width: isMobile ? 32 : 35,
                              height: isMobile ? 32 : 35,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF4A5565),
                                  size: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              width: isMobile ? 32 : 35,
                              height: isMobile ? 32 : 35,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  color: Color(0xFF0A0A0A),
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Hero Image Section
                      SizedBox(
                        width: double.infinity,
                        height: isMobile ? 240 : 280,
                        child: Stack(
                          children: [
                            // Main Image
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://api.builder.io/api/v1/image/assets/TEMP/411d5f7cdcc9181726e609aa273b067faa24870c?width=754',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Premium Villa Badge
                            Positioned(
                              left: isMobile ? 12 : 14,
                              top: isMobile ? 12 : 14,
                              child: Container(
                                width: isMobile ? 110 : 126,
                                height: isMobile ? 28 : 32,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 12 : 14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33554400),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFDC700),
                                      Color(0xFFD08700),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(
                                        'Premium Villa',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isMobile ? 11 : 12,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Arial',
                                          height: isMobile
                                              ? 16 / 11
                                              : 17.5 / 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Image Indicator
                            Positioned(
                              left: 185,
                              bottom: 21,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Property Details Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF3F4F6),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Price and Badge Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Price and Name Column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '₹1.2 Crores',
                                        style: TextStyle(
                                          color: const Color(0xFF0A0A0A),
                                          fontSize: isMobile ? 18 : 21,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Arial',
                                          height: isMobile ? 24 / 18 : 28 / 21,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        'Phoenix Meadows Villa',
                                        style: TextStyle(
                                          color: const Color(0xFF364153),
                                          fontSize: isMobile ? 14 : 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          height: isMobile
                                              ? 20 / 14
                                              : 24.5 / 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Villa Badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 1.75,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.75),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFF3E8FF),
                                        Color(0xFFFCE7F3),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Text(
                                    'Villa',
                                    style: TextStyle(
                                      color: Color(0xFF8200DB),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      height: 14 / 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            // Location Row
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFF6A7282),
                                  size: 14,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  'OMR (IT Corridor), Chennai',
                                  style: TextStyle(
                                    color: const Color(0xFF6A7282),
                                    fontSize: isMobile ? 13 : 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    height: isMobile ? 18 / 13 : 21 / 14,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            // Property Stats Grid
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: isMobile ? 4 : 4,
                              crossAxisSpacing: isMobile ? 3 : 14,
                              mainAxisSpacing: isMobile ? 3 : 14,
                              childAspectRatio: isMobile ? 1 : 1.0,
                              children: [
                                _buildStatCard(
                                  icon: Icons.bed_outlined,
                                  value: '4',
                                  label: 'Bedrooms',
                                  isMobile: isMobile,
                                ),
                                _buildStatCard(
                                  icon: Icons.bathtub_outlined,
                                  value: '3',
                                  label: 'Bathrooms',
                                  isMobile: isMobile,
                                ),
                                _buildStatCard(
                                  icon: Icons.square_foot,
                                  value: '2,850',
                                  label: 'Sq ft',
                                  isMobile: isMobile,
                                ),
                                _buildStatCard(
                                  icon: Icons.landscape_outlined,
                                  value: '0.25 acres',
                                  label: 'Acres',
                                  isMobile: isMobile,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // About Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF3F4F6),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About This Luxury Villa',
                              style: TextStyle(
                                color: const Color(0xFF0A0A0A),
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Arial',
                                height: isMobile ? 20 / 14 : 24 / 16,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Luxurious villa with modern amenities, spacious rooms, and premium finishes. Located in a gated community with excellent facilities.',
                              style: TextStyle(
                                color: const Color(0xFF4A5565),
                                fontSize: isMobile ? 13 : 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                height: isMobile ? 20 / 13 : 23 / 14,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(isMobile ? 12 : 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.75),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFAF5FF),
                                    Color(0xFFFDF2F8),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Text(
                                '🏛️ Built in 2018 • Architectural Excellence',
                                style: TextStyle(
                                  color: const Color(0xFF8200DB),
                                  fontSize: isMobile ? 11 : 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  height: isMobile ? 16 / 11 : 17.5 / 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Amenities Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF3F4F6),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Luxury Features & Amenities',
                              style: TextStyle(
                                color: const Color(0xFF0A0A0A),
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Arial',
                                height: isMobile ? 20 / 14 : 24 / 16,
                              ),
                            ),
                            SizedBox(height: isMobile ? 14 : 17.5),
                            Column(
                              children: [
                                _buildAmenityItem('Modular Kitchen', isMobile),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem('Marble Flooring', isMobile),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem('Car Parking', isMobile),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem('Garden', isMobile),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem(
                                  'Private Garage & Driveway',
                                  isMobile,
                                ),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem(
                                  'Smart Home Technology',
                                  isMobile,
                                ),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem(
                                  'Private Gym & Spa',
                                  isMobile,
                                ),
                                SizedBox(height: isMobile ? 10 : 14),
                                _buildAmenityItem(
                                  '24/7 Security & Concierge',
                                  isMobile,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Contact Button Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isMobile ? 16 : 22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: isMobile ? 48 : 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isMobile ? 8 : 33554400,
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                        ),
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isMobile ? 8 : 33554400,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: isMobile ? 8 : 14),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 14 : 12,
                              fontWeight: isMobile
                                  ? FontWeight.w600
                                  : FontWeight.w700,
                              fontFamily: 'Arial',
                              height: isMobile ? 20 / 14 : 17.5 / 12,
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        gradient: const LinearGradient(
          colors: [Color(0xFFFAF5FF), Color(0xFFFDF2F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF9810FA), size: 25),
          SizedBox(height: isMobile ? 4 : 8),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF0A0A0A),
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Arial',
              height: isMobile ? 20 / 14 : 24.5 / 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6A7282),
              fontSize: isMobile ? 10 : 11,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
              height: isMobile ? 12 / 10 : 14 / 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityItem(String text, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 10.5,
        vertical: isMobile ? 12 : 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        gradient: const LinearGradient(
          colors: [Color(0xFFF0FDF4), Color(0xFFECFDF5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 21,
            height: 21,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF00A63E),
              size: 21,
            ),
          ),
          SizedBox(width: isMobile ? 10 : 14),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF016630),
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: isMobile ? 18 / 13 : 21 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
