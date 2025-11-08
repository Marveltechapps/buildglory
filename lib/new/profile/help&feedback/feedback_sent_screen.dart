import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackSentScreen extends StatelessWidget {
  const FeedbackSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Feedback Sent',
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
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 308),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Success Icon
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                tickgreenIcon,
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Thank You Message
                          SizedBox(
                            height: 71,
                            width: double.infinity,
                            child: Column(
                              children: [
                                // Heading
                                SizedBox(
                                  height: 25,
                                  width: double.infinity,
                                  child: const Text(
                                    'Thank you for your feedback!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF102840),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                // Description
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                    ),
                                    child: const Text(
                                      'We\'ve received your message and our team will get back to you within 24-48 hours.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF4A5565),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                        height: 20 / 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Action Buttons
                          Column(
                            children: [
                              // Primary Button - Back to Help Center
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF155DFC),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(7),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      child: const Text(
                                        'Back to Help Center',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Secondary Button - Back to Profile
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: const Color(0xFFE5E5E5),
                                    width: 1,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(7),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return HomeMainScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      child: const Text(
                                        'Back to Profile',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF191919),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          height: 1,
                                        ),
                                      ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
