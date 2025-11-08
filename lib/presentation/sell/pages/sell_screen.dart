import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/presentation/sellstartfrompage/widgets/sell_start_flow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildMainCard(context),
                      _buildFormContent(),
                      _buildFooterContent(),
                      _buildExchangeCard(),
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

  Widget _buildMainCard(context) {
    return Container(
      margin: const EdgeInsets.all(14),
      width: 334,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: const Offset(0, 20),
          ),
        ],
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF155DFC), Color(0xFF9810FA)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -42,
            top: 0,
            child: Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42.5),
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 57,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.5),
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: Column(
              children: [
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
                          child: Center(child: SvgPicture.asset(homeIcon)),
                        ),
                        const SizedBox(width: 11),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'FREE LISTING',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFDBEAFE),
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Zero Commission',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AVG. TIME',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFDBEAFE),
                            height: 1,
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '24-48 hrs',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            height: 1,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.only(right: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Submit your First Property',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const Text(
                        'Built Glory makes it simple & secure',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDBEAFE),
                          height: 2,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SellStartFlowPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
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
                      horizontal: 33,
                      vertical: 12,
                    ),
                    child: const Text(
                      'Start Selling Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1447E6),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      width: 334,
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
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                'Why Choose Built Glory?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF101828),
                  height: 2,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Trusted by thousands of property owners',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6A7282),
                  height: 1,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          _buildFeatureItem(
            verifyIcon,
            '100% Verified Transactions',
            'Every property and buyer thoroughly verified for your safety',
            Colors.greenAccent,
            Colors.greenAccent.shade100,
          ),
          const SizedBox(height: 14),
          _buildFeatureItem(
            smartIcon,
            'No Middlemen, No Commissions',
            'Direct deals mean maximum profit for you',
            Colors.orangeAccent,
            Colors.orangeAccent.shade100,
          ),
          const SizedBox(height: 14),
          _buildFeatureItem(
            expertIcon,
            'Support Until Final Payment',
            'Dedicated assistance throughout your selling journey',
            Colors.blueAccent,
            Colors.blueAccent.shade100,
          ),
          const SizedBox(height: 21),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatistic('5000+', 'Properties Sold'),
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE5E7EB),
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                ),
                _buildStatistic('98%', 'Success Rate'),
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE5E7EB),
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                ),
                _buildStatistic('4.9★', 'User Rating'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    String iconUrl,
    String title,
    String description,
    Color containerColor,
    Color borderColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: Row(
        children: [
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(iconUrl, width: 24, height: 24),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF101828),
                    height: 1,
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
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF101828),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 23),
      width: 362,
      child: Column(
        children: [
          const Text(
            'Getting Started in 3 Steps',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF101828),
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Simple process to sell your property',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 28),
          Stack(
            children: [
              Positioned(
                top: 21,
                left: 28,
                right: 28,
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: const Color(0xFFE5E7EB),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStep(
                    Icon(Icons.home_outlined),
                    'STEP 1',
                    'Submit Property',
                    'Share your property details',
                    const Color(0xFF155DFC),
                  ),
                  _buildStep(
                    Icon(Icons.visibility),
                    'STEP 2',
                    'Review & Verify',
                    'We verify your property',
                    const Color(0xFF00A63E),
                  ),
                  _buildStep(
                    Icon(Icons.money),
                    'STEP 3',
                    'Receive Offer',
                    'Get fair market offer',
                    const Color(0xFF9810FA),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
    Icon iconUrl,
    String stepNumber,
    String title,
    String description,
    Color stepColor,
  ) {
    return SizedBox(
      width: 111,
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Center(child: iconUrl),
          ),
          const SizedBox(height: 10),
          Text(
            stepNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: stepColor,
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color(0xFF101828),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6A7282),
                height: 1.55,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 23),
      width: 334,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9810FA), Color(0xFF155DFC)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Want to Exchange Instead of Sell?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Swap your property with another via through our Unique Verified Exchange Network.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFF3E8FF),
              height: 1.5,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text(
              'Explore Exchange',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9810FA),
                height: 1,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
