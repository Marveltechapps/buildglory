import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/new/profile/help&feedback/customer_support_screen.dart';
import 'package:buildglory/new/profile/help&feedback/submit_feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpFeedbackPage extends StatelessWidget {
  const HelpFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Help & Feedback',
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
      body: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Main Heading
                          SizedBox(
                            height: 25,
                            width: double.infinity,
                            child: Text(
                              'How can we help you?',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF101828),
                                letterSpacing: -0.17,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Description
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Find answers to your questions or get in touch with our support team',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF4A5565),
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Cards Section
                    Column(
                      children: [
                        // Customer Support Card
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x00000000).withOpacity(0.1),
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CustomerSupportScreen();
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  // Icon Container
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xFFEFF6FF),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 11,
                                      left: 11,
                                      right: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      profilesblueIcon,
                                      width: 14,
                                      height: 14,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Text Content
                                  Expanded(
                                    child: SizedBox(
                                      // height: 46,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // height: 28,
                                            width: double.infinity,
                                            child: Text(
                                              'Customer Support',
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF101828),
                                                height: 1.75,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            // height: 18,
                                            width: double.infinity,
                                            child: Text(
                                              'Get help from our team',
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF4A5565),
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Arrow Icon
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Submit Feedback Card
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x00000000).withOpacity(0.1),
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SubmitFeedbackScreen();
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  // Icon Container
                                  Container(
                                    width: 35,
                                    //   height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xFFEFF6FF),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 11,
                                      left: 11,
                                      right: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      chatblueIcon,
                                      width: 14,
                                      height: 14,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Text Content
                                  Expanded(
                                    child: SizedBox(
                                      //  height: 46,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // height: 28,
                                            width: double.infinity,
                                            child: Text(
                                              'Submit Feedback',
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF101828),
                                                height: 1.75,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            //   height: 18,
                                            width: double.infinity,
                                            child: Text(
                                              'Share your experience',
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF4A5565),
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Arrow Icon
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
