import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/presentation/sellpropertyfirststep/pages/sell_property_first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellStartFlowPage extends StatelessWidget {
  const SellStartFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeroCard(),
                      _buildStepsSection(),
                      _buildWhyListSection(),
                      _buildCallToActionSection(context),
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

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Submit your Free Pr operty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0A0A0A),
                fontFamily: 'Arial',
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0x1A000000)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0x33FFFFFF),
              ),
              child: Center(child: SvgPicture.asset(homeIcon)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Submit your free Property for Sale',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Arial',
                height: 28 / 21,
              ),
            ),
            const SizedBox(height: 11),
            const Text(
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
          ],
        ),
      ),
    );
  }

  Widget _buildStepsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Getting Started in 3 Steps',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
              fontFamily: 'Arial',
              height: 2,
            ),
          ),
          const SizedBox(height: 14),
          _buildStepCard(
            stepNumber: 1,
            stepColor: const Color(0xFF155DFC),
            backgroundColor: const Color(0xFFDBEAFE),
            title: 'Property Information',
            description:
                'Fill in basic details about your property including type, location, size, and specifications.',
          ),
          const SizedBox(height: 14),
          _buildStepCard(
            stepNumber: 2,
            stepColor: const Color(0xFF00A63E),
            backgroundColor: const Color(0xFFDCFCE7),
            title: 'Property Photos',
            description:
                'Upload high-quality photos of your property to attract potential buyers.',
          ),
          const SizedBox(height: 14),
          _buildStepCard(
            stepNumber: 3,
            stepColor: const Color(0xFF9810FA),
            backgroundColor: const Color(0xFFF3E8FF),
            title: 'Review & Submit',
            description:
                'Review all information, add contact details, and submit for approval.',
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required int stepNumber,
    required Color stepColor,
    required Color backgroundColor,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15, right: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: backgroundColor,
            ),
            child: Center(
              child: Container(
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.5),
                  color: stepColor,
                ),
                child: Center(
                  child: Text(
                    stepNumber.toString(),
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
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

  Widget _buildWhyListSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text(
            'Why List With Us?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
              fontFamily: 'Arial',
              height: 2,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: _buildFeatureCard(
                    icon: Icon(Icons.done),
                    title: 'Free Listing',
                    description: 'No charges for listing',
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: _buildFeatureCard(
                    icon: Icon(Icons.person),
                    title: 'Expert Support',
                    description: 'Dedicated assistance',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 15,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: _buildFeatureCard(
                    icon: Icon(Icons.camera_alt_outlined),
                    title: 'Photo Quality',
                    description: 'Professional photos',
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: _buildFeatureCard(
                    icon: Icon(Icons.timelapse_sharp),
                    title: 'Quick Process',
                    description: 'Fast approval',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required Icon icon,
    required String title,
    required String description,
    EdgeInsets? padding,
  }) {
    return Container(
      width: 166,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0x1A000000)),
      ),
      padding: padding ?? const EdgeInsets.all(15),
      child: Column(
        children: [
          icon,
          const SizedBox(height: 28),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
              fontFamily: 'Arial',
              height: 1,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            description,
            textAlign: TextAlign.center,
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

  Widget _buildCallToActionSection(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SellPropertyFirstPage();
              },
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF155DFC),
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 69, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, color: Colors.white),
                  const SizedBox(width: 7),
                  const Text(
                    'Start Property Submission',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Arial',
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
