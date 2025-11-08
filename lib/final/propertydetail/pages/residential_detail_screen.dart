import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/contactus/screens/contactus_screen.dart';
import 'package:buildglory/screens/residential/contactus/simple_contact_page.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResidentialDetailScreen extends StatelessWidget {
  final Property property;
  final String colorcode;
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSharePressed;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onContactPressed;
  final VoidCallback? onViewMapPressed;

  const ResidentialDetailScreen({
    super.key,
    required this.property,
    required this.colorcode,
    required this.title,
    this.onBackPressed,
    this.onSharePressed,
    this.onFavoritePressed,
    this.onContactPressed,
    this.onViewMapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
                letterSpacing: -0.35,
                height: 1.4,
                fontFamily: 'Arial',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        // actions: [
        //   SvgPicture.asset(heartgreyIcon),
        //   SvgPicture.asset(shareblackIcon),
        // ],
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeroSection(context),
                _buildContentSection(),
                _buildContactSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(context) {
    return SizedBox(
      width: double.infinity,
      height: 224,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              property.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                );
              },
            ),
          ),

          // Status badge
          Positioned(
            bottom: 15,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.transparent),
              ),
              child: Text(
                property.status,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1E2939),
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildControlButton({
  //   required String iconUrl,
  //   VoidCallback? onPressed,
  // }) {
  //   return GestureDetector(
  //     onTap: onPressed,
  //     child: Container(
  //       width: 32,
  //       height: 32,
  //       decoration: BoxDecoration(
  //         color: Colors.black.withOpacity(0.2),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Center(
  //         child: SvgPicture.asset(
  //           iconUrl,
  //           width: 14,
  //           height: 14,
  //           errorBuilder: (context, error, stackTrace) {
  //             return const Icon(Icons.error, size: 14, color: Colors.white);
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildContentSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildPropertyDetails(),
          _buildAboutSection(),
          _buildFeaturesSection(),
          _buildLocationSection(),
        ],
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.price,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.42,
                        height: 1.0,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      property.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF364153),
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  property.type,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1447E6),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              SvgPicture.asset(locationgreyIcon, width: 18, height: 17),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  property.location,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  bedblueIcon,
                  property.bedrooms.toString(),
                  "Bedrooms",
                ),
              ),

              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  bathblueIcon,
                  property.bathrooms.toString(),
                  "Bathrooms",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  squarefeetblueIcon,
                  property.sqft.toString(),
                  "Sq ft",
                ),
              ),
              const SizedBox(width: 16),
              title == "Commercial"
                  ? Expanded(
                      child: _buildStatCard(timeblueIcon, "24/7", "Access"),
                    )
                  : SizedBox(),
              title == "Villas"
                  ? Expanded(child: _buildStatCard(acresIcon, "0.23", "Acres"))
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String iconUrl, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            iconUrl,
            color: Color(int.parse(colorcode)),
            width: 21,
            height: 21,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.0,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1.0,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About This Property",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            property.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              height: 1.625,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(11, 11, 10, 11),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Built in ${property.builtYear}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1447E6),
                height: 1.0,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Features & Amenities",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          _buildFeatureGrid(),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      PropertyFeature(name: "Modular Kitchen", iconUrl: tickgreenIcon),
      PropertyFeature(name: "Marble Flooring", iconUrl: tickgreenIcon),
      PropertyFeature(name: "Car Parking", iconUrl: tickgreenIcon),
      PropertyFeature(name: "Garden", iconUrl: tickgreenIcon),
      PropertyFeature(name: "Parking", iconUrl: cargreenIcon),
      PropertyFeature(name: "High-Speed Internet", iconUrl: wifigreenIcon),
      PropertyFeature(name: "Fitness Center", iconUrl: weightgreenIcon),
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildFeatureItem(features[0])),
            const SizedBox(width: 16),
            Expanded(child: _buildFeatureItem(features[1])),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildFeatureItem(features[2])),
            const SizedBox(width: 16),
            Expanded(child: _buildFeatureItem(features[3])),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildFeatureItem(features[4])),
            const SizedBox(width: 16),
            Expanded(child: _buildFeatureItem(features[5])),
          ],
        ),
        const SizedBox(height: 12),
        _buildFeatureItem(features[6]),
      ],
    );
  }

  Widget _buildFeatureItem(PropertyFeature feature) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(feature.iconUrl, width: 18, height: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                height: 1.0,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Location",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  height: 1.4,
                  fontFamily: 'Arial',
                ),
              ),
              GestureDetector(
                onTap: onViewMapPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: const Text(
                    "View on Map",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1A1A),
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: onViewMapPressed,
            child: Container(
              width: double.infinity,
              height: 112,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(locationgreyIcon, fit: BoxFit.cover),
                  const Center(
                    child: Text(
                      "Tap to view map",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6A7282),
                        height: 1.0,
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

  Widget _buildContactSection(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            color: Color(int.parse(colorcode)),
            borderRadius: BorderRadius.circular(16777200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 10),
                blurRadius: 15,
                spreadRadius: -3,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(callwhiteIcon, width: 14, height: 14),
              const SizedBox(width: 16),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
