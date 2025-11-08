import 'package:flutter/material.dart';

class SimpleConfirmationPage extends StatelessWidget {
  const SimpleConfirmationPage({Key? key}) : super(key: key);

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
            margin: isMobile
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildHeaderSection(context, isMobile),
                _buildFormContainer(context, isMobile),
                _buildBottomButtons(context, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF0FDF4), Color(0xFFFFFFFF)],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: isMobile ? 80 : 98,
            height: isMobile ? 80 : 98,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF00C950), Color(0xFF00BC7D)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 50,
                  offset: const Offset(0, 25),
                ),
              ],
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 56),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Thank You! 🎉',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF101828),
                fontSize: isMobile ? 18 : 21,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial',
                height: isMobile ? 24 / 18 : 28 / 21,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: Text(
              'Your luxury villa inquiry has been received. Our premium property specialist will contact you shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF4A5565),
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: isMobile ? 20 / 13 : 23 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      child: Column(
        children: [
          _buildPropertyCard(context, isMobile),
          SizedBox(height: isMobile ? 16 : 17.5),
          _buildContactDetailsCard(context, isMobile),
          SizedBox(height: isMobile ? 16 : 17.5),
          _buildResponseTimeCard(context, isMobile),
          SizedBox(height: isMobile ? 16 : 17.5),
          _buildAssistanceCard(context, isMobile),
          SizedBox(height: isMobile ? 16 : 17.5),
          _buildReferenceCard(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: isMobile ? 120 : 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.75),
                topRight: Radius.circular(12.75),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.75),
                topRight: Radius.circular(12.75),
              ),
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/01403ba24b3d9a2773864013c8d4c014c71cb7d1?width=690',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phoenix Meadows Villa',
                  style: TextStyle(
                    color: Color(0xFF0A0A0A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: 24.5 / 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF4A5565),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'OMR (IT Corridor), Chennai',
                      style: TextStyle(
                        color: Color(0xFF4A5565),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        height: 17.5 / 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '₹1.2 Crores',
                  style: TextStyle(
                    color: Color(0xFF155DFC),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: 21 / 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetailsCard(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Contact Details',
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Arial',
              height: 24.5 / 16,
            ),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            icon: Icons.check_circle_outline,
            iconColor: const Color(0xFF155DFC),
            iconBgColor: const Color(0xFFEFF6FF),
            title: 'suman',
            subtitle: 'Full Name',
          ),
          const SizedBox(height: 10.5),
          _buildContactItem(
            icon: Icons.phone_outlined,
            iconColor: const Color(0xFF00A63E),
            iconBgColor: const Color(0xFFF0FDF4),
            title: '9865432112',
            subtitle: 'Phone Number',
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 17.5),
        ),
        const SizedBox(width: 10.5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF364153),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: 21 / 14,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF6A7282),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: 17.5 / 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResponseTimeCard(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
        ),
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.access_time,
              color: Color(0xFF155DFC),
              size: 21,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expected Response Time',
                  style: TextStyle(
                    color: Color(0xFF1C398E),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: 21 / 14,
                  ),
                ),
                const SizedBox(height: 7),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color(0xFF193CB8),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      height: 17.5 / 12,
                    ),
                    children: [
                      TextSpan(text: 'Our team will contact you '),
                      TextSpan(
                        text: 'within 2 hours',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '\nduring business hours (9 AM - 7 PM, Mon-Sat)',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssistanceCard(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF7ED), Color(0xFFFFFBEB)],
        ),
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Need Immediate Assistance?',
            style: TextStyle(
              color: Color(0xFF7E2A0C),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Arial',
              height: 24 / 16,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Can\'t wait? Connect with us right now for instant help!',
            style: TextStyle(
              color: Color(0xFF9F2D00),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
              height: 17.5 / 12,
            ),
          ),
          const SizedBox(height: 12),
          _buildAssistanceButton(
            icon: Icons.chat_bubble_outline,
            iconColor: const Color(0xFF00A63E),
            title: 'Chat on WhatsApp',
            subtitle: 'Get instant response',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _buildAssistanceButton(
            icon: Icons.phone_outlined,
            iconColor: const Color(0xFF155DFC),
            title: 'Call: +91 98765 43210',
            subtitle: 'Available 9 AM - 7 PM',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAssistanceButton({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.75),
          border: Border.all(color: const Color(0xFFFFD6A7)),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 14),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arial',
                      height: 21 / 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF6A7282),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      height: 14 / 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferenceCard(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Reference Number',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
              height: 21 / 14,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'REF-437162',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF155DFC),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Consolas',
              height: 24.5 / 16,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Save this number for future reference',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF6A7282),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
              height: 14 / 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 17.5),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: isMobile ? 12 : 10.25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF9810FA)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home_outlined,
                    color: Color(0xFF9810FA),
                    size: 14,
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Browse More Villas',
                    style: TextStyle(
                      color: Color(0xFF9810FA),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      height: 17.5 / 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.5),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: isMobile ? 12 : 10.25,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                'Back to Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Arial',
                  height: 17.5 / 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
