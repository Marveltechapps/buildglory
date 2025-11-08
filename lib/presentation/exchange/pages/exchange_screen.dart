import 'package:buildglory/presentation/sellstartfrompage/widgets/sell_start_flow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isTablet = screenWidth <= 991;
        final isMobile = screenWidth <= 640;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : (isTablet ? 14 : 16),
            vertical: isMobile ? 10 : (isTablet ? 12 : 14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Purple gradient card
              _buildMainCard(isMobile, isTablet, context),

              SizedBox(height: isMobile ? 14 : (isTablet ? 16 : 19)),

              // Feature cards section
              _buildFeatureCards(isMobile, isTablet),

              SizedBox(height: isMobile ? 14 : (isTablet ? 16 : 19)),

              // Getting started section
              _buildGettingStartedSection(isMobile, isTablet),

              SizedBox(height: isMobile ? 14 : (isTablet ? 16 : 19)),

              // Final gradient card
              _buildNetworkCard(isMobile, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainCard(bool isMobile, bool isTablet, context) {
    return Container(
      width: isMobile ? double.infinity : (isTablet ? double.infinity : 334),
      height: 233,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9810FA), Color(0xFF8200DB), Color(0xFF372AAC)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: isMobile ? 18 : 21,
          top: isMobile ? 18 : 21,
          bottom: isMobile ? 36 : 42,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Center(
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.75),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SvgPicture.string(
                      '''<svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M16.0638 11.916L13.1471 14.8327L10.2305 11.916" stroke="#9810FA" stroke-width="1.45833" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M13.1445 14.8327V3.16602" stroke="#9810FA" stroke-width="1.45833" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M2.9375 6.08268L5.85417 3.16602L8.77083 6.08268" stroke="#9810FA" stroke-width="1.45833" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M5.85547 3.16602V14.8327" stroke="#9810FA" stroke-width="1.45833" stroke-linecap="round" stroke-linejoin="round"/>
                      </svg>''',
                      width: 17.5,
                      height: 17.5,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Heading
            const Text(
              'Submit your First Exchange Property',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.5,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 7),

            // Subtitle
            const Text(
              'Built Glory makes it simple, secure.',
              style: TextStyle(
                color: Color(0xFFF3E8FF),
                fontSize: 12,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
                height: 1.46,
              ),
            ),

            const SizedBox(height: 20),

            // Button
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
                width: 117,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.75),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Start Selling Now',
                    style: TextStyle(
                      color: Color(0xFF8200DB),
                      fontSize: 12,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      height: 1.46,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCards(bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: [
          _buildFeatureCard(
            iconColor: const Color(0xFF00A63E),
            backgroundColor: const Color(0xFFDCFCE7),
            title: '100% Verified',
            subtitle: 'Transactions',
            svgIcon:
                '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M19.234 8.74907C19.6336 10.7102 19.3488 12.7491 18.4271 14.5256C17.5054 16.3022 16.0025 17.7091 14.1691 18.5117C12.3356 19.3143 10.2824 19.4641 8.35187 18.9361C6.42133 18.4082 4.73015 17.2343 3.56035 15.6103C2.39055 13.9863 1.81284 12.0104 1.92356 10.012C2.03429 8.01367 2.82675 6.11365 4.1688 4.62885C5.51085 3.14405 7.32137 2.1642 9.29841 1.85272C11.2755 1.54124 13.2995 1.91695 15.0331 2.9172" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M8.03125 9.625L10.6562 12.25L19.4062 3.5" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: true,
          ),
          const SizedBox(height: 12),
          _buildFeatureCard(
            iconColor: const Color(0xFFF54900),
            backgroundColor: const Color(0xFFFFEDD4),
            title: 'No Middlemen,',
            subtitle: 'No Commissions.',
            svgIcon:
                '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_2022_12332)">
                <path d="M20.0621 8.74907C20.4617 10.7102 20.1769 12.7491 19.2552 14.5256C18.3335 16.3022 16.8306 17.7091 14.9972 18.5117C13.1637 19.3143 11.1105 19.4641 9.17999 18.9361C7.24946 18.4082 5.55827 17.2343 4.38847 15.6103C3.21867 13.9863 2.64096 12.0104 2.75169 10.012C2.86241 8.01367 3.65488 6.11365 4.99693 4.62885C6.33898 3.14405 8.14949 2.1642 10.1265 1.85272C12.1036 1.54124 14.1277 1.91695 15.8612 2.9172" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M8.85938 9.625L11.4844 12.25L20.2344 3.5" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              </g>
              <defs>
                <clipPath id="clip0_2022_12332">
                  <rect width="21" height="21" fill="white" transform="translate(0.984375)"/>
                </clipPath>
              </defs>
            </svg>''',
            isMobile: true,
          ),
          const SizedBox(height: 12),
          _buildFeatureCard(
            iconColor: const Color(0xFF155DFC),
            backgroundColor: const Color(0xFFDBEAFE),
            title: 'Support Until',
            subtitle: 'Final Payment',
            svgIcon:
                '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M19.9059 8.74907C20.3055 10.7102 20.0207 12.7491 19.099 14.5256C18.1773 16.3022 16.6744 17.7091 14.8409 18.5117C13.0075 19.3143 10.9543 19.4641 9.02374 18.9361C7.09321 18.4082 5.40202 17.2343 4.23222 15.6103C3.06242 13.9863 2.48471 12.0104 2.59544 10.012C2.70616 8.01367 3.49863 6.11365 4.84068 4.62885C6.18273 3.14405 7.99324 2.1642 9.97029 1.85272C11.9473 1.54124 13.9714 1.91695 15.705 2.9172" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M8.70312 9.625L11.3281 12.25L20.0781 3.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: true,
          ),
        ],
      );
    }

    return SizedBox(
      width: isMobile ? double.infinity : (isTablet ? double.infinity : 334),
      height: 145.5,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: _buildFeatureCard(
              iconColor: const Color(0xFF00A63E),
              backgroundColor: const Color(0xFFDCFCE7),
              title: '100% Verified',
              subtitle: 'Transactions',
              svgIcon:
                  '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19.234 8.74907C19.6336 10.7102 19.3488 12.7491 18.4271 14.5256C17.5054 16.3022 16.0025 17.7091 14.1691 18.5117C12.3356 19.3143 10.2824 19.4641 8.35187 18.9361C6.42133 18.4082 4.73015 17.2343 3.56035 15.6103C2.39055 13.9863 1.81284 12.0104 1.92356 10.012C2.03429 8.01367 2.82675 6.11365 4.1688 4.62885C5.51085 3.14405 7.32137 2.1642 9.29841 1.85272C11.2755 1.54124 13.2995 1.91695 15.0331 2.9172" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M8.03125 9.625L10.6562 12.25L19.4062 3.5" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>''',
              isMobile: false,
            ),
          ),
          Positioned(
            left: 115,
            top: 0,
            child: _buildFeatureCard(
              iconColor: const Color(0xFFF54900),
              backgroundColor: const Color(0xFFFFEDD4),
              title: 'No Middlemen,',
              subtitle: 'No Commissions.',
              svgIcon:
                  '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_2022_12332)">
                  <path d="M20.0621 8.74907C20.4617 10.7102 20.1769 12.7491 19.2552 14.5256C18.3335 16.3022 16.8306 17.7091 14.9972 18.5117C13.1637 19.3143 11.1105 19.4641 9.17999 18.9361C7.24946 18.4082 5.55827 17.2343 4.38847 15.6103C3.21867 13.9863 2.64096 12.0104 2.75169 10.012C2.86241 8.01367 3.65488 6.11365 4.99693 4.62885C6.33898 3.14405 8.14949 2.1642 10.1265 1.85272C12.1036 1.54124 14.1277 1.91695 15.8612 2.9172" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M8.85938 9.625L11.4844 12.25L20.2344 3.5" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                </g>
                <defs>
                  <clipPath id="clip0_2022_12332">
                    <rect width="21" height="21" fill="white" transform="translate(0.984375)"/>
                  </clipPath>
                </defs>
              </svg>''',
              isMobile: false,
            ),
          ),
          Positioned(
            left: 230,
            top: 0,
            child: _buildFeatureCard(
              iconColor: const Color(0xFF155DFC),
              backgroundColor: const Color(0xFFDBEAFE),
              title: 'Support Until',
              subtitle: 'Final Payment',
              svgIcon:
                  '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19.9059 8.74907C20.3055 10.7102 20.0207 12.7491 19.099 14.5256C18.1773 16.3022 16.6744 17.7091 14.8409 18.5117C13.0075 19.3143 10.9543 19.4641 9.02374 18.9361C7.09321 18.4082 5.40202 17.2343 4.23222 15.6103C3.06242 13.9863 2.48471 12.0104 2.59544 10.012C2.70616 8.01367 3.49863 6.11365 4.84068 4.62885C6.18273 3.14405 7.99324 2.1642 9.97029 1.85272C11.9473 1.54124 13.9714 1.91695 15.705 2.9172" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M8.70312 9.625L11.3281 12.25L20.0781 3.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>''',
              isMobile: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required String svgIcon,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 104,
      height: 146,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: backgroundColor,
            ),
            child: Center(
              child: SvgPicture.string(svgIcon, width: 21, height: 21),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 10.5,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 1.33,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF4A5565),
              fontSize: 10.5,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 1.33,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGettingStartedSection(bool isMobile, bool isTablet) {
    return Container(
      width: isMobile ? double.infinity : (isTablet ? double.infinity : 362),
      padding: EdgeInsets.only(
        left: isMobile ? 12 : 14,
        right: isMobile ? 12 : 14,
        top: isMobile ? 12 : 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Getting Started in 4 Steps',
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 16,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 1.53,
            ),
          ),

          SizedBox(height: isMobile ? 12 : 14),

          // Step 1
          _buildStepCard(
            backgroundColor: const Color(0xFFEFF6FF),
            borderColor: const Color(0xFFBEDBFF),
            iconColor: const Color(0xFF155DFC),
            title: 'Submit your current property',
            description:
                'Pick the property you currently own and want to exchange.',
            svgIcon:
                '''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M13.125 18.875V11.875C13.125 11.6429 13.0328 11.4204 12.8687 11.2563C12.7046 11.0922 12.4821 11 12.25 11H8.75C8.51794 11 8.29538 11.0922 8.13128 11.2563C7.96719 11.4204 7.875 11.6429 7.875 11.875V18.875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M2.625 9.24954C2.62494 8.99498 2.68042 8.74346 2.78756 8.51255C2.89471 8.28163 3.05095 8.07687 3.24538 7.91254L9.37037 2.66342C9.68624 2.39646 10.0864 2.25 10.5 2.25C10.9136 2.25 11.3138 2.39646 11.6296 2.66342L17.7546 7.91254C17.9491 8.07687 18.1053 8.28163 18.2124 8.51255C18.3196 8.74346 18.3751 8.99498 18.375 9.24954V17.1245C18.375 17.5887 18.1906 18.0338 17.8624 18.362C17.5342 18.6902 17.0891 18.8745 16.625 18.8745H4.375C3.91087 18.8745 3.46575 18.6902 3.13756 18.362C2.80937 18.0338 2.625 17.5887 2.625 17.1245V9.24954Z" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: isMobile,
          ),

          SizedBox(height: isMobile ? 12 : 14),

          // Step 2
          _buildStepCard(
            backgroundColor: const Color(0xFFF0FDF4),
            borderColor: const Color(0xFFB9F8CF),
            iconColor: const Color(0xFF00A63E),
            title: 'Browse eligible exchange properties',
            description:
                'We\'ve matched properties that suit your budget and lifestyle.',
            svgIcon:
                '''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M18.3756 19.0006L14.5781 15.2031" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M9.625 17.25C13.491 17.25 16.625 14.116 16.625 10.25C16.625 6.38401 13.491 3.25 9.625 3.25C5.75901 3.25 2.625 6.38401 2.625 10.25C2.625 14.116 5.75901 17.25 9.625 17.25Z" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: isMobile,
            isLarger: true,
          ),

          SizedBox(height: isMobile ? 12 : 14),

          // Step 3
          _buildStepCard(
            backgroundColor: const Color(0xFFFEFCE8),
            borderColor: const Color(0xFFFFF085),
            iconColor: const Color(0xFFD08700),
            title: 'View Exchange Summary',
            description:
                'Get the full breakdown — value, difference, and timelines.',
            svgIcon:
                '''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M15.75 2.125H5.25C4.2835 2.125 3.5 2.9085 3.5 3.875V17.875C3.5 18.8415 4.2835 19.625 5.25 19.625H15.75C16.7165 19.625 17.5 18.8415 17.5 17.875V3.875C17.5 2.9085 16.7165 2.125 15.75 2.125Z" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M7 5.625H14" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M14 12.625V16.125" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M14 9.125H14.0088" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M10.5 9.125H10.5088" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M7 9.125H7.00875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M10.5 12.625H10.5088" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M7 12.625H7.00875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M10.5 16.125H10.5088" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M7 16.125H7.00875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: isMobile,
          ),

          SizedBox(height: isMobile ? 12 : 14),

          // Step 4
          _buildStepCard(
            backgroundColor: const Color(0xFFFAF5FF),
            borderColor: const Color(0xFFE9D4FF),
            iconColor: const Color(0xFF9810FA),
            title: 'Final Review & Confirmation',
            description:
                'Review your exchange deal one last time before locking it in.',
            svgIcon:
                '''<svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M19.0777 9.25005C19.4773 11.2112 19.1926 13.25 18.2709 15.0266C17.3492 16.8032 15.8463 18.2101 14.0128 19.0127C12.1794 19.8153 10.1262 19.9651 8.19562 19.4371C6.26508 18.9091 4.5739 17.7353 3.4041 16.1113C2.2343 14.4873 1.65659 12.5114 1.76731 10.513C1.87804 8.51464 2.6705 6.61463 4.01255 5.12983C5.3546 3.64502 7.16512 2.66518 9.14216 2.3537C11.1192 2.04222 13.1433 2.41793 14.8769 3.41818" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M7.875 10.125L10.5 12.75L19.25 4" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>''',
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required Color backgroundColor,
    required Color borderColor,
    required Color iconColor,
    required String title,
    required String description,
    required String svgIcon,
    required bool isMobile,
    bool isLarger = false,
  }) {
    return Container(
      // height: isLarger ? 116 : 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.75),
              color: iconColor,
            ),
            child: Center(
              child: SvgPicture.string(svgIcon, width: 21, height: 21),
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
                    color: Color(0xFF0A0A0A),
                    fontSize: 16,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 3.5),

                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF4A5565),
                    fontSize: 12,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    height: 1.46,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkCard(bool isMobile, bool isTablet) {
    return Container(
      width: isMobile ? double.infinity : (isTablet ? double.infinity : 334),
      height: 141,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF00A63E), Color(0xFF155DFC)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12 : 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.75),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: SvgPicture.string(
                      '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19.1406 14.6875L15.6406 18.1875L12.1406 14.6875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M15.6406 18.1875V4.1875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M3.39062 7.6875L6.89062 4.1875L10.3906 7.6875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M6.89062 4.1875V18.1875" stroke="white" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      </svg>''',
                      width: 21,
                      height: 21,
                    ),
                  ),
                ),

                const SizedBox(width: 10.5),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Smart Property Exchange Network',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 3.5),

                      const Text(
                        'Connect with property owners looking for similar exchanges. No agents, no commissions.',
                        style: TextStyle(
                          color: Color(0xFFDCFCE7),
                          fontSize: 12,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 12 : 14),

            Container(
              width: 85,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.75),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'Learn More',
                  style: TextStyle(
                    color: Color(0xFF00A63E),
                    fontSize: 12,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    height: 1.46,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
