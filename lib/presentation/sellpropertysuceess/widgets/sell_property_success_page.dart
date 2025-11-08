import 'package:buildglory/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';

class SellPropertySuccessPage extends StatelessWidget {
  const SellPropertySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 359),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Success Header
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDCFCE7),
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Icon(Icons.done)),
                        ),
                        const SizedBox(height: 18),

                        // Success Message
                        const Text(
                          'Property Submitted Successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0A0A0A),
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Description
                        const Text(
                          'Thank you for choosing us to sell your property. Your listing has been received and is under review.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            fontFamily: 'Arial',
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Listing ID Container
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 327),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: const Color(0xFFBEDBFF)),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Your Listing ID',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF193CB8),
                                  fontFamily: 'Arial',
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'SPLXG41SO',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1C398E),
                                  fontFamily: 'Consolas',
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Property Summary Card
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0x1A000000)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 325),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Header
                          Row(
                            children: [
                              Icon(Icons.home_outlined),
                              const SizedBox(width: 8),
                              const Text(
                                'Property Summary',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Property Details
                          _buildPropertyDetailRow(
                            'Property Type:',
                            'apartment',
                          ),
                          const SizedBox(height: 12),
                          _buildPropertyDetailRow(
                            'Configuration:',
                            '2BHK',
                            isUppercase: true,
                          ),
                          const SizedBox(height: 12),
                          _buildPropertyDetailRow(
                            'Location:',
                            'jhghkj, bangalore',
                          ),
                          const SizedBox(height: 12),
                          _buildPropertyDetailRow(
                            'Expected Price:',
                            '₹7,879',
                            valueColor: const Color(0xFF00A63E),
                          ),
                          const SizedBox(height: 12),
                          _buildPropertyDetailRow('Owner:', 'Suman'),
                          const SizedBox(height: 12),
                          _buildPropertyDetailRow('Contact:', ''),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // What Happens Next Card
                  Container(
                    width: 327,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0x1A000000)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 325),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Header
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded),
                              const SizedBox(width: 8),
                              const Text(
                                'What Happens Next?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Steps
                          _buildStepItem(
                            '1',
                            'Review Process (24-48 hours)',
                            'Our team will verify your property details and documentation',
                            const Color(0xFFDBEAFE),
                            const Color(0xFF155DFC),
                          ),
                          const SizedBox(height: 12),
                          _buildStepItem(
                            '2',
                            'Property Listing',
                            'Your property will be listed on our platform and partner sites',
                            const Color(0xFFDCFCE7),
                            const Color(0xFF00A63E),
                          ),
                          const SizedBox(height: 12),
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
                  ),
                  const SizedBox(height: 16),

                  // Need Help Card
                  Container(
                    width: 327,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFFBEDBFF)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 325),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Header
                          Row(
                            children: [
                              Icon(Icons.people_alt_outlined),
                              const SizedBox(width: 8),
                              const Text(
                                'Need Help?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          const Text(
                            'Our dedicated support team is here to assist you throughout the selling process.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF364153),
                              fontFamily: 'Arial',
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Support Buttons
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF155DFC),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.call_outlined),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Call Support',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 11),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: const Color(0xFF8EC5FF),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.chat_outlined),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Chat',
                                      style: TextStyle(
                                        fontSize: 12,
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
                  ),
                  const SizedBox(height: 16),

                  // Testimonial Card
                  Container(
                    width: 327,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFFB9F8CF)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDCFCE7),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.star_border_outlined),
                          ),
                        ),
                        const SizedBox(width: 14),
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
                                  fontFamily: 'Arial',
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
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
                  ),
                  const SizedBox(height: 16),

                  // Action Buttons
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        // Back to Home Button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePageBuy();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF155DFC),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_outlined, color: Colors.white),
                                const SizedBox(width: 14),
                                const Text(
                                  'Back to Home',
                                  style: TextStyle(
                                    fontSize: 12,
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

                        // Sell Another Property Button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePageBuy();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: const Color(0xFF8EC5FF),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Center(
                              child: Text(
                                'Sell Another Property',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF155DFC),
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Footer Message
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyDetailRow(
    String label,
    String value, {
    Color? valueColor,
    bool isUppercase = false,
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
          isUppercase ? value.toUpperCase() : value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: valueColor ?? const Color(0xFF0A0A0A),
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  Widget _buildStepItem(
    String number,
    String title,
    String description,
    Color backgroundColor,
    Color textColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
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
                  color: Color(0xFF0A0A0A),
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
                  fontFamily: 'Arial',
                  height: 1.27,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
