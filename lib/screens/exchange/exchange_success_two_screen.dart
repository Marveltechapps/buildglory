import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:buildglory/screens/exchange/empty_matched_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExchangeSuccessTwoScreen extends StatelessWidget {
  const ExchangeSuccessTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                const SuccessHeader(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const WhatHappensNextCard(),
                      const SizedBox(height: 24),
                      const WhyPropertyExchangeCard(),
                      const SizedBox(height: 24),
                      const VerifiedNetworkBenefitsCard(),
                      const SizedBox(height: 24),
                      const ActionButtonsSection(),
                      const SizedBox(height: 14),
                      const NotificationText(),
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

class SuccessHeader extends StatelessWidget {
  const SuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF0FDF4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Container(
            width: 98,
            height: 98,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(49),
              color: const Color(0xFF00C950),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 50,
                  offset: const Offset(0, 25),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                tickwhiteIcon,
                width: 56,
                height: 56,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(maxWidth: 342),
            child: const Text(
              'Exchange Request Submitted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
                letterSpacing: -0.42,
                fontFamily: 'Arial',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 316),
              child: const Text(
                'Congratulations! Your property exchange request has been successfully submitted to our Verified Exchange Network.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  height: 1.625,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhatHappensNextCard extends StatelessWidget {
  const WhatHappensNextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
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
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'What Happens Next?',
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
          const SizedBox(height: 16),
          const ProcessStep(
            number: '1',
            backgroundColor: Color(0xFFF3E8FF),
            textColor: Color(0xFF9810FA),
            title: 'Property Verification (48-72 hours)',
            description:
                'Our team will verify your property details and legal documentation',
          ),
          const SizedBox(height: 12),
          const ProcessStep(
            number: '2',
            backgroundColor: Color(0xFFDBEAFE),
            textColor: Color(0xFF155DFC),
            title: 'Network Matching',
            description:
                'We\'ll match you with verified property owners interested in exchange',
          ),
          const SizedBox(height: 12),
          const ProcessStep(
            number: '3',
            backgroundColor: Color(0xFFDCFCE7),
            textColor: Color(0xFF00A63E),
            title: 'Mutual Site Visits',
            description: 'We\'ll coordinate property viewings for both parties',
          ),
          const SizedBox(height: 12),
          const ProcessStep(
            number: '4',
            backgroundColor: Color(0xFFFFEDD4),
            textColor: Color(0xFFF54900),
            title: 'Legal Exchange Process',
            description:
                'Complete documentation and registration with our legal support',
          ),
        ],
      ),
    );
  }
}

class ProcessStep extends StatelessWidget {
  final String number;
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final String description;

  const ProcessStep({
    super.key,
    required this.number,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: backgroundColor,
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
}

class WhyPropertyExchangeCard extends StatelessWidget {
  const WhyPropertyExchangeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFEFF6FF),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Why Property Exchange?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 12),
          const BenefitItem(
            text: 'Save on brokerage fees (typically 1-2% of property value)',
          ),
          const SizedBox(height: 7),
          const BenefitItem(text: 'Avoid lengthy sell-then-buy process'),
          const SizedBox(height: 7),
          const BenefitItem(
            text: 'Lower stamp duty compared to sale transactions',
          ),
          const SizedBox(height: 7),
          const BenefitItem(
            text: 'Immediate property swap with verified owners',
          ),
        ],
      ),
    );
  }
}

class BenefitItem extends StatelessWidget {
  final String text;

  const BenefitItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: const Text(
            '•',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF155DFC),
              fontFamily: 'Arial',
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF364153),
              height: 1.5,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ],
    );
  }
}

class VerifiedNetworkBenefitsCard extends StatelessWidget {
  const VerifiedNetworkBenefitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD4E7FF)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                exchangeIcon,
                color: Colors.purple,
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Verified Exchange Network Benefits',
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
          const NetworkBenefit(
            iconUrl: "",
            title: '100% Verified Properties',
            description:
                'All properties in our exchange network are legally verified',
          ),
          const SizedBox(height: 8),
          const NetworkBenefit(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/2a53855a046beb030748368a212d4cd84240764c?placeholderIfAbsent=true',
            title: 'Legal Documentation Support',
            description:
                'Complete assistance with exchange deeds and paperwork',
          ),
          const SizedBox(height: 8),
          const NetworkBenefit(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/cb94b248ea5e51ffb31e3a6630d5bd0db6eb9d37?placeholderIfAbsent=true',
            title: 'Fair Market Valuation',
            description:
                'Professional property assessment for equitable exchanges',
          ),
        ],
      ),
    );
  }
}

class NetworkBenefit extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String description;

  const NetworkBenefit({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(iconUrl, width: 18, height: 18, fit: BoxFit.contain),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A1A1A),
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4A5565),
                  height: 1.5,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF155DFC),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 11),
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
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EmptyMatchedPropertyScreen();
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: const Color(0xFFB2D1FF)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 67, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  exchangeIcon,
                  color: Color(0xFF155DFC),
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    'Submit Another Exchange',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF155DFC),
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationText extends StatelessWidget {
  const NotificationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You will receive email and SMS updates about your exchange request status',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: Color(0xFF6A7282),
        height: 1.27,
        fontFamily: 'Arial',
      ),
    );
  }
}
