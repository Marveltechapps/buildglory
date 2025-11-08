import 'package:buildglory/screens/exchange/widgets/cta_card.dart';
import 'package:buildglory/screens/exchange/widgets/feature_card.dart';
import 'package:buildglory/screens/exchange/widgets/step_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyExchangeWidget extends StatelessWidget {
  const PropertyExchangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [
          // Main purple card
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 334),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF8200DB),
              border: Border.all(color: const Color(0x1A000000)),
            ),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0x33FFFFFF),
                  ),
                  child: Center(
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.string(
                        '''<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M14 2L21 9H15V20H13V9H7L14 2Z" fill="white"/>
                        </svg>''',
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Content container
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 290),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: const Text(
                          'Submit your First Exchange Property',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: -0.17,
                            height: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Paragraph
                      SizedBox(
                        height: 18,
                        width: double.infinity,
                        child: const Text(
                          'Built Glory makes it simple, secure.',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF3E8FF),
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFFFFFF),
                  ),
                  padding: const EdgeInsets.fromLTRB(11, 3, 11, 3),
                  child: const Text(
                    'Start Selling Now',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8200DB),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 23),
          // Feature cards row
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 334),
            child: Row(
              children: [
                Expanded(
                  child: FeatureCard(
                    iconSvg:
                        '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M9 16.17L4.83 12L3.41 13.41L9 19L21 7L19.59 5.59L9 16.17Z" fill="#00A63E"/>
                    </svg>''',
                    backgroundColor: const Color(0xFFDCFCE7),
                    title: '100% Verified',
                    subtitle: 'Transactions',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    iconSvg:
                        '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 9V7L15 5.5V7.5L19 8.5V9H21ZM3 9V8.5L7 7.5V5.5L1 7V9H3ZM11 15.5V22H13V15.5L15.5 14L14.5 12L12 13L9.5 12L8.5 14L11 15.5Z" fill="#D08700"/>
                    </svg>''',
                    backgroundColor: const Color(0xFFFFEDD4),
                    title: 'No Middlemen,',
                    subtitle: 'No Commissions',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    iconSvg:
                        '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2L13.09 8.26L20 9L13.09 9.74L12 16L10.91 9.74L4 9L10.91 8.26L12 2Z" fill="#155DFC"/>
                    </svg>''',
                    backgroundColor: const Color(0xFFDBEAFE),
                    title: 'Support Until',
                    subtitle: 'Final Payment',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 23),
          // Getting Started section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section heading
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: const Text(
                  'Getting Started in 4 Steps',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.16,
                    height: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Steps container
              SizedBox(
                // height: 512,
                width: double.infinity,
                child: Column(
                  children: [
                    StepCard(
                      iconSvg:
                          '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19ZM17 12H7V10H17V12Z" fill="white"/>
                      </svg>''',
                      backgroundColor: const Color(0xFFEFF6FF),
                      borderColor: const Color(0xFFBEDBFF),
                      iconBackgroundColor: const Color(0xFF155DFC),
                      title: 'Submit your current property',
                      description:
                          'Pick the property you currently own and want to exchange.',
                    ),
                    const SizedBox(height: 14),
                    StepCard(
                      iconSvg:
                          '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M15.5 14H14.71L14.43 13.73C15.41 12.59 16 11.11 16 9.5C16 5.91 13.09 3 9.5 3S3 5.91 3 9.5S5.91 16 9.5 16C11.11 16 12.59 15.41 13.73 14.43L14 14.71V15.5L19 20.49L20.49 19L15.5 14ZM9.5 14C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5S14 7.01 14 9.5S11.99 14 9.5 14Z" fill="white"/>
                      </svg>''',
                      backgroundColor: const Color(0xFFF0FDF4),
                      borderColor: const Color(0xFFB9F8CF),
                      iconBackgroundColor: const Color(0xFF00A63E),
                      title: 'Browse eligible exchange properties',
                      description:
                          'We\'ve matched properties that suit your budget and lifestyle.',
                    ),
                    const SizedBox(height: 14),
                    StepCard(
                      iconSvg:
                          '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M14 2H6C4.9 2 4 2.9 4 4V20C4 21.1 4.89 22 5.99 22H18C19.1 22 20 21.1 20 20V8L14 2ZM18 20H6V4H13V9H18V20Z" fill="white"/>
                      </svg>''',
                      backgroundColor: const Color(0xFFFEFCE8),
                      borderColor: const Color(0xFFFFF085),
                      iconBackgroundColor: const Color(0xFFD08700),
                      title: 'View Exchange Summary',
                      description:
                          'Get the full breakdown — value, difference, and timelines.',
                    ),
                    const SizedBox(height: 14),
                    StepCard(
                      iconSvg:
                          '''<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M9 16.17L4.83 12L3.41 13.41L9 19L21 7L19.59 5.59L9 16.17Z" fill="white"/>
                      </svg>''',
                      backgroundColor: const Color(0xFFFAF5FF),
                      borderColor: const Color(0xFFE9D4FF),
                      iconBackgroundColor: const Color(0xFF9810FA),
                      title: 'Final Review & Confirmation',
                      description:
                          'Review your exchange deal one last time before locking it in.',
                    ),

                    //  const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
