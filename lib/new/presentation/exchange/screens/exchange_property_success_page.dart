import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/property_summary_card.dart';
import '../widgets/benefits_card.dart';
import '../widgets/process_steps_card.dart';
import '../widgets/support_team_card.dart';
import '../widgets/benefits_list_card.dart';

class ExchangePropertySuccessPage extends StatelessWidget {
  const ExchangePropertySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Success Icon
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE9E8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            tickblueIcon,
                            width: 42,
                            height: 42,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // Success Title
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: double.infinity,
                        child: const Text(
                          'Exchange Request Submitted!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1A1A1A),
                            letterSpacing: -0.42,
                            fontFamily: 'Arial',
                            height: 1.0,
                          ),
                        ),
                      ),

                      // Success Description
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        width: double.infinity,
                        child: const Text(
                          'Congratulations! Your property exchange request has been successfully submitted to our Verified Exchange Network.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            fontFamily: 'Arial',
                            height: 1.5,
                          ),
                        ),
                      ),

                      // Exchange ID Card
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F5FF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFD4E5FF)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Your Exchange ID',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF155DFC),
                                fontFamily: 'Arial',
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'EXCI0JS19',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF155DFC),
                                fontFamily: 'Consolas',
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Start Exchange Process Button
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF155DFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 70,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                exchangeIcon,
                                width: 14,
                                height: 14,
                                color: Colors.white,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 40),
                              const Text(
                                'Start Exchange Process',
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
                    ],
                  ),
                ),

                // Cards Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      const PropertySummaryCard(),
                      const SizedBox(height: 24),
                      const BenefitsCard(),
                      const SizedBox(height: 24),
                      const ProcessStepsCard(),
                      const SizedBox(height: 24),
                      const SupportTeamCard(),
                      const SizedBox(height: 24),
                      const BenefitsListCard(),
                      const SizedBox(height: 24),

                      // Action Buttons
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomeMainScreen();
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF155DFC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                  horizontal: 70,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    homewhiteIcon,
                                    width: 14,
                                    height: 14,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 15),
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
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomeMainScreen();
                                    },
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFFB2D1FF),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                  horizontal: 67,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    exchangeIcon,
                                    color: blueColor,
                                    width: 14,
                                    height: 14,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Submit Another Exchange',
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
                          ),
                        ],
                      ),

                      // Footer Text
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: double.infinity,
                        child: const Text(
                          'You will receive email and SMS updates about your exchange request status',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                            height: 1.27,
                          ),
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
    );
  }
}
