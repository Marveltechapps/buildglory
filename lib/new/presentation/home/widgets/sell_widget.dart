import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/pages/sell_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellWidget extends StatelessWidget {
  const SellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Blue promotional card
        Container(
          // width: 332,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: blueColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25,
                offset: const Offset(0, 20),
              ),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Header section with icon and stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Center(child: SvgPicture.asset(homewhiteIcon)),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FREE LISTING',
                              style: TextStyle(
                                fontSize: 11,
                                color: const Color(0xFFDBEAFE),
                                fontFamily: 'Arial',
                                height: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Zero Commission',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Arial',
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'AVG. TIME',
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xFFDBEAFE),
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '24-48 hrs',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Arial',
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Main content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Submit your First Property',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Arial',
                        letterSpacing: -0.21,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Built Glory makes it simple & secure',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFFDBEAFE),
                        fontFamily: 'Arial',
                        height: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // CTA Button
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SellMainScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 90,
                    ),
                    child: Center(
                      child: Text(
                        'Start Selling Now',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xFF1447E6),
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 23),
        // White informational card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
            border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Column(
                children: [
                  Text(
                    'Why Choose Built Glory?',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF101828),
                      fontFamily: 'Arial',
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Trusted by thousands of property owners',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF6A7282),
                      fontFamily: 'Arial',
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Feature cards
              Column(
                children: [
                  _buildFeatureCard(
                    backgroundColor: const Color(0xFFF0FDF4),
                    borderColor: const Color(0xFFDCFCE7),
                    iconBackgroundColor: const Color(0xFF00C950),
                    iconUrl: homewhiteIcon,
                    title: '100% Verified Transactions',
                    description:
                        'Every property and buyer thoroughly verified for your safety',
                  ),
                  const SizedBox(height: 14),
                  _buildFeatureCard(
                    backgroundColor: const Color(0xFFFFF7ED),
                    borderColor: const Color(0xFFFFEDD4),
                    iconBackgroundColor: const Color(0xFFFF6900),
                    iconUrl: dollorwhiteIcon,
                    title: 'No Middlemen, No Commissions',
                    description: 'Direct deals mean maximum profit for you',
                  ),
                  const SizedBox(height: 14),
                  _buildFeatureCard(
                    backgroundColor: const Color(0xFFEFF6FF),
                    borderColor: const Color(0xFFDBEAFE),
                    iconBackgroundColor: const Color(0xFF2B7FFF),
                    iconUrl: profilewhiteIcon,
                    title: 'Support Until Final Payment',
                    description:
                        'Dedicated assistance throughout your selling journey',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Statistics section
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: const Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatistic('5000+', 'Properties Sold'),
                    Container(
                      width: 1,
                      height: 28,
                      color: const Color(0xFFE5E7EB),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    _buildStatistic('98%', 'Success Rate'),
                    Container(
                      width: 1,
                      height: 28,
                      color: const Color(0xFFE5E7EB),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    _buildStatistic('4.9★', 'User Rating'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
        // Getting Started section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              // Header
              Column(
                children: [
                  Text(
                    'Getting Started in 3 Steps',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFF101828),
                      fontFamily: 'Arial',
                      letterSpacing: -0.17,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Simple process to sell your property',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF6A7282),
                      fontFamily: 'Arial',
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              // Steps visualization
              Container(
                height: 154,
                child: Stack(
                  children: [
                    // Progress line
                    Positioned(
                      top: 21,
                      left: 28,
                      right: 28,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B7FFF),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),
                    ),
                    // Steps
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStep(
                            backgroundColor: const Color(0xFF155DFC),
                            iconUrl: homewhiteIcon,
                            stepNumber: 'STEP 1',
                            stepColor: const Color(0xFF155DFC),
                            title: 'Submit Property',
                            description: 'Share your property details',
                          ),
                          _buildStep(
                            backgroundColor: const Color(0xFF00A63E),
                            iconUrl: eyewhiteIcon,
                            stepNumber: 'STEP 2',
                            stepColor: const Color(0xFF00A63E),
                            title: 'Review & Verify',
                            description: 'We verify your property',
                          ),
                          _buildStep(
                            backgroundColor: const Color(0xFF9810FA),
                            iconUrl: dollorwhiteIcon,
                            stepNumber: 'STEP 3',
                            stepColor: const Color(0xFF9810FA),
                            title: 'Receive Offer',
                            description: 'Get fair market offer',
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
        const SizedBox(height: 23),
        // Purple exchange card
        Container(
          // width: 334,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF4F39F6),
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          ),
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Want to Exchange Instead of Sell?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: 'Arial',
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Swap your property with another via through our Unique Verified Exchange Network.',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFFF3E8FF),
                  fontFamily: 'Arial',
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                child: Text(
                  'Explore Exchange',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF4F39F6),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildFeatureCard({
  required Color backgroundColor,
  required Color borderColor,
  required Color iconBackgroundColor,
  required String iconUrl,
  required String title,
  required String description,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: backgroundColor,
      border: Border.all(color: borderColor, width: 1),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
    child: Row(
      children: [
        Container(
          width: 49,
          height: 49,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: iconBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(iconUrl, width: 25, height: 25),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF101828),
                  fontFamily: 'Arial',
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 11,
                  color: const Color(0xFF4A5565),
                  fontFamily: 'Arial',
                  height: 1.27,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildStatistic(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 12,
          color: const Color(0xFF101828),
          fontFamily: 'Arial',
          height: 1,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: const Color(0xFF6A7282),
          fontFamily: 'Arial',
          height: 1,
        ),
      ),
    ],
  );
}

Widget _buildStep({
  required Color backgroundColor,
  required String iconUrl,
  required String stepNumber,
  required Color stepColor,
  required String title,
  required String description,
}) {
  return Container(
    width: 111,
    child: Column(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: backgroundColor,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(iconUrl, width: 21, height: 21),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Text(
              stepNumber,
              style: TextStyle(
                fontSize: 11,
                color: stepColor,
                fontFamily: 'Arial',
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: const Color(0xFF101828),
                fontFamily: 'Arial',
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 11,
                  color: const Color(0xFF6A7282),
                  fontFamily: 'Arial',
                  height: 1.55,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
