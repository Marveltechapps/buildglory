import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Container(
      width: isTablet ? double.infinity : 349,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: const Color(0x1A000000)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          _buildContentSection(isMobile),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 168,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.75),
              topRight: Radius.circular(12.75),
            ),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/05978f2c7df8f865c83719eb933f7978a4a6e86a?width=696',
              width: double.infinity,
              height: 168,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 11,
            top: 11,
            child: Row(
              children: [
                _buildBadge('Green Score: 95', const Color(0xFF009966), hasIcon: true),
                const SizedBox(width: 7),
                _buildBadge('A+ Energy', const Color(0xFF00C950)),
              ],
            ),
          ),
          Positioned(
            right: 11,
            top: 11,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.75),
                color: const Color(0xE6FFFFFF),
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 14,
                color: Color(0xFF4A5565),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color backgroundColor, {bool hasIcon = false}) {
    return Container(
      height: 19.5,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.75),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIcon) ...[
            const Icon(
              Icons.eco,
              size: 11,
              color: Colors.white,
            ),
            const SizedBox(width: 3.5),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.27,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPropertyInfo(isMobile),
          const SizedBox(height: 12),
          _buildPropertyDetails(isMobile),
          const SizedBox(height: 12),
          _buildEcoFeatures(),
          const SizedBox(height: 12),
          _buildCarbonImpact(isMobile),
          const SizedBox(height: 12),
          _buildCertificationBadge(),
          const SizedBox(height: 12),
          _buildViewDetailsButton(),
        ],
      ),
    );
  }

  Widget _buildPropertyInfo(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPropertyTitle(),
          const SizedBox(height: 8),
          _buildPropertyBadge(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildPropertyTitle()),
        _buildPropertyBadge(),
      ],
    );
  }

  Widget _buildPropertyTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EcoVilla Green Paradise',
          style: TextStyle(
            color: Color(0xFF101828),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.53,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 3.5),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 14,
              color: Color(0xFF4A5565),
            ),
            const SizedBox(width: 3.5),
            const Text(
              'ECR, Chennai',
              style: TextStyle(
                color: Color(0xFF4A5565),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.46,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
        const SizedBox(height: 3.5),
        const Text(
          '₹1.8 Crores',
          style: TextStyle(
            color: Color(0xFF009966),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.36,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyBadge() {
    return Container(
      width: 56,
      height: 19.5,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.75),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      child: const Center(
        child: Text(
          'Eco Villa',
          style: TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 11,
            fontWeight: FontWeight.w400,
            height: 1.27,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyDetails(bool isMobile) {
    final details = [
      {'icon': Icons.home_outlined, 'text': '4 BR'},
      {'icon': Icons.bathroom_outlined, 'text': '3 BA'},
      {'icon': Icons.square_foot_outlined, 'text': '3,200 sqft'},
    ];

    if (isMobile) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: details.map((detail) => _buildDetailItem(detail)).toList(),
      );
    }

    return Row(
      children: details
          .map((detail) => Expanded(child: _buildDetailItem(detail)))
          .toList(),
    );
  }

  Widget _buildDetailItem(Map<String, dynamic> detail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          detail['icon'],
          size: 14,
          color: const Color(0xFF4A5565),
        ),
        const SizedBox(width: 8),
        Text(
          detail['text'],
          style: const TextStyle(
            color: Color(0xFF4A5565),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.46,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildEcoFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.eco,
              size: 14,
              color: Color(0xFF009966),
            ),
            const SizedBox(width: 7),
            const Text(
              'Eco Features:',
              style: TextStyle(
                color: Color(0xFF364153),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.46,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 3.5,
          children: [
            _buildFeatureBadge('Solar Power'),
            _buildFeatureBadge('Organic Materials'),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureBadge(String text) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.75),
        color: const Color(0xFFECFDF5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF007A55),
            fontSize: 11,
            fontWeight: FontWeight.w400,
            height: 1.27,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  Widget _buildCarbonImpact(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.recycling,
                size: 14,
                color: Color(0xFF009966),
              ),
              const SizedBox(width: 7),
              const Text(
                'Carbon Impact:',
                style: TextStyle(
                  color: Color(0xFF364153),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.46,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.verified,
                size: 14,
                color: Color(0xFFF0B100),
              ),
              const SizedBox(width: 3.5),
              const Text(
                'Certified',
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
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.recycling,
              size: 14,
              color: Color(0xFF009966),
            ),
            const SizedBox(width: 7),
            const Text(
              'Carbon Impact:',
              style: TextStyle(
                color: Color(0xFF364153),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.46,
                fontFamily: 'Arial',
              ),
            ),
            const SizedBox(width: 7),
            const Text(
              'Net Zero',
              style: TextStyle(
                color: Color(0xFF009966),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.46,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.verified,
              size: 14,
              color: Color(0xFFF0B100),
            ),
            const SizedBox(width: 3.5),
            const Text(
              'Certified',
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
      ],
    );
  }

  Widget _buildCertificationBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.75),
        border: Border.all(color: const Color(0xFFA4F4CF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            size: 11,
            color: Color(0xFF007A55),
          ),
          const SizedBox(width: 7),
          const Text(
            'IGBC Platinum',
            style: TextStyle(
              color: Color(0xFF007A55),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.27,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewDetailsButton() {
    return Container(
      width: double.infinity,
      height: 31.5,
      child: ElevatedButton(
        onPressed: () {
          // Handle view details
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF009966),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.75),
          ),
          elevation: 0,
        ),
        child: const Text(
          'View Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.46,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
