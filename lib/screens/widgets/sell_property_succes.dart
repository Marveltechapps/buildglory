import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellPropertySuccess extends StatelessWidget {
  const SellPropertySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_buildSuccessHeader(), _buildContentSection(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFFDCFCE7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                tickgreenIcon,
                width: 42,
                height: 42,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Property Submitted Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.42,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Text(
              'Thank you for choosing us to sell your property. Your listing has been received and is under review.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A5565),
                height: 1.5,
                fontFamily: 'Arial',
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFBEDBFF)),
            ),
            child: Column(
              children: [
                const Text(
                  'Your Listing ID',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF193CB8),
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'SPLLLFUOA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C398E),
                    height: 1.4,
                    fontFamily: 'Consolas',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          _buildPropertySummaryCard(),
          const SizedBox(height: 20),
          _buildWhatHappensNextCard(),
          const SizedBox(height: 20),
          _buildNeedHelpCard(),
          const SizedBox(height: 20),
          _buildTestimonialCard(),
          const SizedBox(height: 20),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildPropertySummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  homeblueIcon,
                  width: 18,
                  height: 17,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Property Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildPropertyDetailRow('Property Type:', 'apartment'),
            const SizedBox(height: 11),
            _buildPropertyDetailRow('Configuration:', '2BHK'),
            const SizedBox(height: 11),
            _buildPropertyDetailRow('Location:', 'SDF, bangalore'),
            const SizedBox(height: 11),
            _buildPropertyDetailRow('Expected Price:', '₹66', isPrice: true),
            const SizedBox(height: 11),
            _buildPropertyDetailRow('Owner:', 'R6U'),
            const SizedBox(height: 11),
            _buildPropertyDetailRow('Contact:', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyDetailRow(
    String label,
    String value, {
    bool isPrice = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4A5565),
            fontFamily: 'Arial',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isPrice ? const Color(0xFF00A63E) : const Color(0xFF1A1A1A),
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildWhatHappensNextCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  timeIcon,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Text(
                  'What Happens Next?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStepItem(
              '1',
              'Review Process (24-48 hours)',
              'Our team will verify your property details and documentation',
              const Color(0xFFDBEAFE),
              const Color(0xFF155DFC),
            ),
            const SizedBox(height: 14),
            _buildStepItem(
              '2',
              'Property Listing',
              'Your property will be listed on our platform and partner sites',
              const Color(0xFFDCFCE7),
              const Color(0xFF00A63E),
            ),
            const SizedBox(height: 14),
            _buildStepItem(
              '3',
              'Buyer Matching',
              'We\'ll connect you with interested and verified buyers',
              const Color(0xFFF3E8FF),
              const Color(0xFF9810FA),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem(
    String number,
    String title,
    String description,
    Color bgColor,
    Color textColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
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
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  height: 1.27,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNeedHelpCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  profilesblueIcon,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Need Help?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Our dedicated support team is here to assist you throughout the selling process.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF364153),
                height: 1.5,
                fontFamily: 'Arial',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF155DFC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        callwhiteIcon,
                        width: 14,
                        height: 14,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Call Support',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF8EC5FF)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        chatblueIcon,
                        width: 14,
                        height: 14,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 13),
                      const Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF155DFC),
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB9F8CF)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFDCFCE7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                stargreenIcon,
                width: 21,
                height: 21,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '"I sold my apartment through this platform in just 3 weeks. The process was smooth and hassle-free. Highly recommended!"',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF364153),
                    height: 1.5,
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  '- Rajesh Kumar, Chennai',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeMainScreen();
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF155DFC),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  homewhiteIcon,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 11),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF8EC5FF)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Center(
            child: Text(
              'Sell Another Property',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF155DFC),
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'You will receive email and SMS updates about your listing status',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6A7282),
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }
}
