import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Customer Support',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A1A),
            letterSpacing: -0.35,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Header Section
                      Column(
                        children: [
                          // Main Title
                          Container(
                            width: double.infinity,
                            height: 25,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Customer Support',
                              style: TextStyle(
                                color: Color(0xFF102840),
                                fontSize: 18,
                                letterSpacing: -0.17,
                                height: 1.4,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Description
                          const Text(
                            'Choose how you\'d like to get in touch with us',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF4A5565),
                              fontSize: 12,
                              height: 1,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Contact Information Card
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card Title
                            const Text(
                              'Contact Information',
                              style: TextStyle(
                                color: Color(0xFF102840),
                                fontSize: 14,
                                height: 24 / 14,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Phone Section
                            Row(
                              children: [
                                SvgPicture.asset(
                                  callgreyIcon,
                                  width: 14,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 11),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 18,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Phone',
                                          style: TextStyle(
                                            color: Color(0xFF102840),
                                            fontSize: 12,
                                            height: 1,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 18,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          '+91 98765 43210',
                                          style: TextStyle(
                                            color: Color(0xFF155DFC),
                                            fontSize: 12,
                                            height: 1,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Email Section
                            Row(
                              children: [
                                SvgPicture.asset(
                                  mailgreyIcon,
                                  width: 14,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 11),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 18,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Email',
                                          style: TextStyle(
                                            color: Color(0xFF102840),
                                            fontSize: 12,
                                            height: 1,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 18,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'support@buildglory.com',
                                          style: TextStyle(
                                            color: Color(0xFF155DFC),
                                            fontSize: 12,
                                            height: 1,
                                            fontFamily: 'Arial',
                                          ),
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
                      const SizedBox(height: 24),
                      // Office Hours Card
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card Title
                            const Text(
                              'Office Hours',
                              style: TextStyle(
                                color: Color(0xFF102840),
                                fontSize: 16,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Office Hours List
                            Container(
                              constraints: const BoxConstraints(maxWidth: 321),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Monday - Friday: 9:00 AM - 8:00 PM',
                                    style: TextStyle(
                                      color: Color(0xFF4A5565),
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Saturday: 9:00 AM - 6:00 PM',
                                    style: TextStyle(
                                      color: Color(0xFF4A5565),
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Sunday: 10:00 AM - 4:00 PM',
                                    style: TextStyle(
                                      color: Color(0xFF4A5565),
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
