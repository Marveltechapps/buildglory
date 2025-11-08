import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/pages/sell_property_one_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellMainScreen extends StatelessWidget {
  const SellMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Submit your Free Property',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.35,
            fontFamily: 'Arial',
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          //constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              //  const _HeaderSection(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeroCard(),
                        SizedBox(height: 20),
                        _StepsSection(),
                        SizedBox(height: 20),
                        // WhyListWithUs(),
                        _FeaturesSection(),
                        SizedBox(height: 20),
                        _CallToActionSection(),
                      ],
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

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1447E6),
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33554400),
              color: const Color(0x33FFFFFF),
            ),
            child: Center(
              child: SvgPicture.asset(
                homewhiteIcon,
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 282,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: const Text(
              'Submit your free Property for Sale',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: -0.21,
                fontFamily: 'Arial',
                height: 28 / 21,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 282,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: const Text(
              'Get started with our simple, secure property listing process. We make selling your property hassle-free.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDBEAFE),
                fontFamily: 'Arial',
                height: 20 / 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepsSection extends StatelessWidget {
  const _StepsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Getting Started in 3 Steps',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1A1A1A),
            fontFamily: 'Arial',
            height: 2,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            _StepCard(
              stepNumber: '1',
              stepColor: const Color(0xFF155DFC),
              backgroundColor: const Color(0xFFDBEAFE),
              title: 'Property Information',
              description:
                  'Fill in basic details about your property including type, location, size, and specifications.',
            ),
            const SizedBox(height: 12),
            _StepCard(
              stepNumber: '2',
              stepColor: const Color(0xFF00A63E),
              backgroundColor: const Color(0xFFDCFCE7),
              title: 'Property Photos',
              description:
                  'Upload high-quality photos of your property to attract potential buyers.',
            ),
            const SizedBox(height: 12),
            _StepCard(
              stepNumber: '3',
              stepColor: const Color(0xFF9810FA),
              backgroundColor: const Color(0xFFF3E8FF),
              title: 'Review & Submit',
              description:
                  'Review all information, add contact details, and submit for approval.',
            ),
          ],
        ),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  final String stepNumber;
  final Color stepColor;
  final Color backgroundColor;
  final String title;
  final String description;

  const _StepCard({
    required this.stepNumber,
    required this.stepColor,
    required this.backgroundColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33554400),
              color: backgroundColor,
            ),
            child: Center(
              child: Container(
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33554400),
                  color: stepColor,
                ),
                child: Center(
                  child: Text(
                    stepNumber,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Arial',
                      height: 1,
                    ),
                  ),
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
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                    fontFamily: 'Arial',
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    fontFamily: 'Arial',
                    height: 18 / 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Why List With Us?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1A1A1A),
            fontFamily: 'Arial',
            height: 2,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _FeatureCard(
                    iconUrl: tickgreenIcon,
                    title: 'Free Listing',
                    description: 'No charges for listing',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _FeatureCard(
                    iconUrl: profilecircleIcon,
                    title: 'Expert Support',
                    description: 'Dedicated assistance',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _FeatureCard(
                    iconUrl: cameraIcon,
                    title: 'Photo Quality',
                    description: 'Professional photos',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _FeatureCard(
                    iconUrl: timeIcon,
                    title: 'Quick Process',
                    description: 'Fast approval',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String description;

  const _FeatureCard({
    required this.iconUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(iconUrl, width: 28, height: 28, fit: BoxFit.contain),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              fontFamily: 'Arial',
              height: 1,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A5565),
              fontFamily: 'Arial',
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _CallToActionSection extends StatelessWidget {
  const _CallToActionSection();

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
                  return SellPropertyOneScreen();
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
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  doucmentwhiteIcon,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Start Property Submission',
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
        const SizedBox(height: 8),
        const Text(
          'Takes only 10-15 minutes to complete',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6A7282),
            fontFamily: 'Arial',
            height: 1,
          ),
        ),
      ],
    );
  }
}
