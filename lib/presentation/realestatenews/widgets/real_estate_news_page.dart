import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'news_card.dart';
import 'market_highlight_card.dart';
import 'custom_button.dart';

class RealEstateNewsPage extends StatelessWidget {
  const RealEstateNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640 && screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Container(
          width: isMobile ? double.infinity : 377,
          margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : (screenWidth - 377) / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Container
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                child: Row(
                  children: [
                    // Back Button
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(33554400)),
                      ),
                      child: Center(
                        child: SvgPicture.string(
                          '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.50008 11.8337L3.41675 7.75033L7.50008 3.66699" stroke="#0A0A0A" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M11.5834 7.75H3.41675" stroke="#0A0A0A" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                          </svg>''',
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Header Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Real Estate News',
                            style: TextStyle(
                              color: Color(0xFF0A0A0A),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 24.5 / 18,
                              fontFamily: 'Arial',
                            ),
                          ),
                          const Text(
                            'Stay updated with the latest market trends and insights',
                            style: TextStyle(
                              color: Color(0xFF4A5565),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 17.5 / 12,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Form Container
              Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Featured Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.75),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                            offset: Offset(0, 4),
                            blurRadius: 6,
                            spreadRadius: -1,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image Container
                          Container(
                            width: double.infinity,
                            height: 168,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.75),
                                    topRight: Radius.circular(12.75),
                                  ),
                                  child: Image.network(
                                    'https://api.builder.io/api/v1/image/assets/TEMP/813050a3a3800cfeb3c9c561924d28eb1d2ba03d?width=706',
                                    width: double.infinity,
                                    height: 168,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  left: 11,
                                  top: 14,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6.75),
                                    ),
                                    child: const Text(
                                      'Market',
                                      style: TextStyle(
                                        color: Color(0xFF1447E6),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        height: 14 / 11,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Card Content
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Old Mahabalipuram road (OMR), Chennai - Evolving residential market of Chennai IT Corridor',
                                  style: TextStyle(
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 24.5 / 16,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                                const SizedBox(height: 11),
                                const Text(
                                  'The Mahabalipuram road (OMR), Chennai has witnessed one of the biggest IT Corridor hotspots and is home to many IT/ITES companies...',
                                  style: TextStyle(
                                    color: Color(0xFF4A5565),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 17.5 / 12,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                                const SizedBox(height: 11),

                                // Date and Time Row
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.string(
                                          '''<svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_3190_1794)">
                                              <path d="M3.5 1.125V2.875" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M7 1.125V2.875" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M8.3125 2H2.1875C1.70425 2 1.3125 2.39175 1.3125 2.875V9C1.3125 9.48325 1.70425 9.875 2.1875 9.875H8.3125C8.79575 9.875 9.1875 9.48325 9.1875 9V2.875C9.1875 2.39175 8.79575 2 8.3125 2Z" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M1.3125 4.625H9.1875" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_3190_1794">
                                                <rect width="10.5" height="10.5" fill="white" transform="translate(0 0.25)"/>
                                              </clipPath>
                                            </defs>
                                          </svg>''',
                                          width: 10.5,
                                          height: 10.5,
                                        ),
                                        const SizedBox(width: 3.5),
                                        const Text(
                                          'March 15, 2024',
                                          style: TextStyle(
                                            color: Color(0xFF6A7282),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            height: 14 / 11,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 14),
                                    Row(
                                      children: [
                                        SvgPicture.string(
                                          '''<svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_3190_1802)">
                                              <path d="M5.45312 2.875V5.5L7.20312 6.375" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M5.45312 9.875C7.86937 9.875 9.82812 7.91625 9.82812 5.5C9.82812 3.08375 7.86937 1.125 5.45312 1.125C3.03688 1.125 1.07812 3.08375 1.07812 5.5C1.07812 7.91625 3.03688 9.875 5.45312 9.875Z" stroke="#6A7282" stroke-width="0.875" stroke-linecap="round" stroke-linejoin="round"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_3190_1802">
                                                <rect width="10.5" height="10.5" fill="white" transform="translate(0.203125 0.25)"/>
                                              </clipPath>
                                            </defs>
                                          </svg>''',
                                          width: 10.5,
                                          height: 10.5,
                                        ),
                                        const SizedBox(width: 3.5),
                                        const Text(
                                          '5 min read',
                                          style: TextStyle(
                                            color: Color(0xFF6A7282),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            height: 14 / 11,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 11),

                                // Action Buttons
                                isMobile
                                    ? Column(
                                        children: [
                                          CustomButton(
                                            text: 'View Report',
                                            backgroundColor: const Color(0xFF155DFC),
                                            textColor: Colors.white,
                                            icon: SvgPicture.string(
                                              '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M9.71867 1.66699H4.46867C4.15925 1.66699 3.8625 1.78991 3.64371 2.0087C3.42492 2.22749 3.302 2.52424 3.302 2.83366V12.167C3.302 12.4764 3.42492 12.7732 3.64371 12.992C3.8625 13.2107 4.15925 13.3337 4.46867 13.3337H11.4687C11.7781 13.3337 12.0748 13.2107 12.2936 12.992C12.5124 12.7732 12.6353 12.4764 12.6353 12.167V4.58366L9.71867 1.66699Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M9.1355 1.66699V4.00033C9.1355 4.30974 9.25841 4.60649 9.47721 4.82528C9.696 5.04408 9.99275 5.16699 10.3022 5.16699H12.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M6.80216 5.75H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M10.3022 8.08301H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M10.3022 10.417H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              </svg>''',
                                              width: 14,
                                              height: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          CustomButton(
                                            text: 'Read More',
                                            backgroundColor: Colors.white,
                                            textColor: const Color(0xFF155DFC),
                                            borderColor: const Color(0xFF155DFC),
                                            icon: SvgPicture.string(
                                              '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M1.67172 7.70297C1.6231 7.572 1.6231 7.42793 1.67172 7.29697C2.14521 6.14888 2.94893 5.16724 3.981 4.47649C5.01306 3.78574 6.22699 3.41699 7.46888 3.41699C8.71077 3.41699 9.9247 3.78574 10.9568 4.47649C11.9888 5.16724 12.7926 6.14888 13.266 7.29697C13.3147 7.42793 13.3147 7.572 13.266 7.70297C12.7926 8.85105 11.9888 9.83269 10.9568 10.5234C9.9247 11.2142 8.71077 11.5829 7.46888 11.5829C6.22699 11.5829 5.01306 11.2142 3.981 10.5234C2.94893 9.83269 2.14521 8.85105 1.67172 7.70297Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M7.46875 9.25C8.43525 9.25 9.21875 8.4665 9.21875 7.5C9.21875 6.5335 8.43525 5.75 7.46875 5.75C6.50225 5.75 5.71875 6.5335 5.71875 7.5C5.71875 8.4665 6.50225 9.25 7.46875 9.25Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              </svg>''',
                                              width: 14,
                                              height: 14,
                                              color: const Color(0xFF155DFC),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              text: 'View Report',
                                              backgroundColor: const Color(0xFF155DFC),
                                              textColor: Colors.white,
                                              icon: SvgPicture.string(
                                                '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                  <path d="M9.71867 1.66699H4.46867C4.15925 1.66699 3.8625 1.78991 3.64371 2.0087C3.42492 2.22749 3.302 2.52424 3.302 2.83366V12.167C3.302 12.4764 3.42492 12.7732 3.64371 12.992C3.8625 13.2107 4.15925 13.3337 4.46867 13.3337H11.4687C11.7781 13.3337 12.0748 13.2107 12.2936 12.992C12.5124 12.7732 12.6353 12.4764 12.6353 12.167V4.58366L9.71867 1.66699Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                  <path d="M9.1355 1.66699V4.00033C9.1355 4.30974 9.25841 4.60649 9.47721 4.82528C9.696 5.04408 9.99275 5.16699 10.3022 5.16699H12.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                  <path d="M6.80216 5.75H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                  <path d="M10.3022 8.08301H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                  <path d="M10.3022 10.417H5.6355" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>''',
                                                width: 14,
                                                height: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10.5),
                                          CustomButton(
                                            text: 'Read More',
                                            backgroundColor: Colors.white,
                                            textColor: const Color(0xFF155DFC),
                                            borderColor: const Color(0xFF155DFC),
                                            icon: SvgPicture.string(
                                              '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M1.67172 7.70297C1.6231 7.572 1.6231 7.42793 1.67172 7.29697C2.14521 6.14888 2.94893 5.16724 3.981 4.47649C5.01306 3.78574 6.22699 3.41699 7.46888 3.41699C8.71077 3.41699 9.9247 3.78574 10.9568 4.47649C11.9888 5.16724 12.7926 6.14888 13.266 7.29697C13.3147 7.42793 13.3147 7.572 13.266 7.70297C12.7926 8.85105 11.9888 9.83269 10.9568 10.5234C9.9247 11.2142 8.71077 11.5829 7.46888 11.5829C6.22699 11.5829 5.01306 11.2142 3.981 10.5234C2.94893 9.83269 2.14521 8.85105 1.67172 7.70297Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M7.46875 9.25C8.43525 9.25 9.21875 8.4665 9.21875 7.5C9.21875 6.5335 8.43525 5.75 7.46875 5.75C6.50225 5.75 5.71875 6.5335 5.71875 7.5C5.71875 8.4665 6.50225 9.25 7.46875 9.25Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              </svg>''',
                                              width: 14,
                                              height: 14,
                                              color: const Color(0xFF155DFC),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Latest Updates Section
                    const Text(
                      'Latest Updates',
                      style: TextStyle(
                        color: Color(0xFF0A0A0A),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 24.5 / 16,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 12),

                    // News Card
                    NewsCard(
                      imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/47f3a4b618ed516c382bbc0b8e10473160e47f2a?width=168',
                      badge: 'Report',
                      badgeColor: const Color(0xFF8200DB),
                      badgeBackgroundColor: const Color(0xFFF3E8FF),
                      title: 'Real Estate for NRIs and PGO: Investment Opportunities',
                      description: 'Discover the investment opportunities for NRIs and PGO in Chennai\'s booming real estate market with expert guidance...',
                      date: 'March 12, 2024',
                      readTime: '8 min',
                      isMobile: isMobile,
                    ),
                  ],
                ),
              ),

              // Footer Container - Market Highlights
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Market Highlights',
                      style: TextStyle(
                        color: Color(0xFF0A0A0A),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 24.5 / 16,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Market Highlights Grid
                    isMobile
                        ? Column(
                            children: [
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="28" viewBox="0 0 29 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M7.125 25.6663V4.66634C7.125 4.0475 7.37083 3.45401 7.80842 3.01643C8.246 2.57884 8.83949 2.33301 9.45833 2.33301H18.7917C19.4105 2.33301 20.004 2.57884 20.4416 3.01643C20.8792 3.45401 21.125 4.0475 21.125 4.66634V25.6663H7.125Z" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M7.12492 14H4.79159C4.17275 14 3.57925 14.2458 3.14167 14.6834C2.70408 15.121 2.45825 15.7145 2.45825 16.3333V23.3333C2.45825 23.9522 2.70408 24.5457 3.14167 24.9832C3.57925 25.4208 4.17275 25.6667 4.79159 25.6667H7.12492" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M21.125 10.5H23.4583C24.0772 10.5 24.6707 10.7458 25.1082 11.1834C25.5458 11.621 25.7917 12.2145 25.7917 12.8333V23.3333C25.7917 23.9522 25.5458 24.5457 25.1082 24.9832C24.6707 25.4208 24.0772 25.6667 23.4583 25.6667H21.125" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 7H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 11.667H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 16.333H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 21H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '15%',
                                valueColor: const Color(0xFF155DFC),
                                label: 'YoY Growth',
                              ),
                              const SizedBox(height: 12),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="28" viewBox="0 0 29 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M23.9584 11.6663C23.9584 17.4915 17.4962 23.5582 15.3262 25.4318C15.1241 25.5839 14.878 25.666 14.6251 25.666C14.3721 25.666 14.1261 25.5839 13.9239 25.4318C11.7539 23.5582 5.29175 17.4915 5.29175 11.6663C5.29175 9.19099 6.27508 6.81702 8.02542 5.06668C9.77576 3.31634 12.1497 2.33301 14.6251 2.33301C17.1004 2.33301 19.4744 3.31634 21.2247 5.06668C22.9751 6.81702 23.9584 9.19099 23.9584 11.6663Z" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M14.625 15.167C16.558 15.167 18.125 13.6 18.125 11.667C18.125 9.734 16.558 8.16699 14.625 8.16699C12.692 8.16699 11.125 9.734 11.125 11.667C11.125 13.6 12.692 15.167 14.625 15.167Z" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '25+',
                                valueColor: const Color(0xFF00A63E),
                                label: 'Hot Locations',
                              ),
                              const SizedBox(height: 12),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="29" viewBox="0 0 29 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M14.125 2.58301V25.9163" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M19.9583 6.08301H11.2083C10.1254 6.08301 9.08675 6.51322 8.32098 7.27899C7.55521 8.04476 7.125 9.08337 7.125 10.1663C7.125 11.2493 7.55521 12.2879 8.32098 13.0537C9.08675 13.8195 10.1254 14.2497 11.2083 14.2497H17.0417C18.1246 14.2497 19.1632 14.6799 19.929 15.4457C20.6948 16.2114 21.125 17.25 21.125 18.333C21.125 19.416 20.6948 20.4546 19.929 21.2204C19.1632 21.9861 18.1246 22.4163 17.0417 22.4163H7.125" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '₹8.5L',
                                valueColor: const Color(0xFF9810FA),
                                label: 'Avg. Price/sqft',
                              ),
                              const SizedBox(height: 12),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="29" viewBox="0 0 29 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M19.2916 24.75V22.4167C19.2916 21.179 18.7999 19.992 17.9248 19.1168C17.0496 18.2417 15.8626 17.75 14.6249 17.75H7.62492C6.38724 17.75 5.20026 18.2417 4.32509 19.1168C3.44992 19.992 2.95825 21.179 2.95825 22.4167V24.75" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M19.2917 3.89941C20.2925 4.15885 21.1787 4.74322 21.8114 5.56082C22.444 6.37842 22.7873 7.38295 22.7873 8.41675C22.7873 9.45054 22.444 10.4551 21.8114 11.2727C21.1787 12.0903 20.2925 12.6746 19.2917 12.9341" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M26.2917 24.7497V22.4164C26.291 21.3824 25.9468 20.3779 25.3133 19.5607C24.6799 18.7435 23.7929 18.1599 22.7917 17.9014" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.1249 13.0833C13.7022 13.0833 15.7916 10.994 15.7916 8.41667C15.7916 5.83934 13.7022 3.75 11.1249 3.75C8.54759 3.75 6.45825 5.83934 6.45825 8.41667C6.45825 10.994 8.54759 13.0833 11.1249 13.0833Z" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '2.3K',
                                valueColor: const Color(0xFFF54900),
                                label: 'New Investors',
                              ),
                            ],
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.1,
                            children: [
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="28" viewBox="0 0 29 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M7.125 25.6663V4.66634C7.125 4.0475 7.37083 3.45401 7.80842 3.01643C8.246 2.57884 8.83949 2.33301 9.45833 2.33301H18.7917C19.4105 2.33301 20.004 2.57884 20.4416 3.01643C20.8792 3.45401 21.125 4.0475 21.125 4.66634V25.6663H7.125Z" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M7.12492 14H4.79159C4.17275 14 3.57925 14.2458 3.14167 14.6834C2.70408 15.121 2.45825 15.7145 2.45825 16.3333V23.3333C2.45825 23.9522 2.70408 24.5457 3.14167 24.9832C3.57925 25.4208 4.17275 25.6667 4.79159 25.6667H7.12492" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M21.125 10.5H23.4583C24.0772 10.5 24.6707 10.7458 25.1082 11.1834C25.5458 11.621 25.7917 12.2145 25.7917 12.8333V23.3333C25.7917 23.9522 25.5458 24.5457 25.1082 24.9832C24.6707 25.4208 24.0772 25.6667 23.4583 25.6667H21.125" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 7H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 11.667H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 16.333H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.7917 21H16.4584" stroke="#155DFC" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '15%',
                                valueColor: const Color(0xFF155DFC),
                                label: 'YoY Growth',
                              ),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="28" viewBox="0 0 29 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M23.9584 11.6663C23.9584 17.4915 17.4962 23.5582 15.3262 25.4318C15.1241 25.5839 14.878 25.666 14.6251 25.666C14.3721 25.666 14.1261 25.5839 13.9239 25.4318C11.7539 23.5582 5.29175 17.4915 5.29175 11.6663C5.29175 9.19099 6.27508 6.81702 8.02542 5.06668C9.77576 3.31634 12.1497 2.33301 14.6251 2.33301C17.1004 2.33301 19.4744 3.31634 21.2247 5.06668C22.9751 6.81702 23.9584 9.19099 23.9584 11.6663Z" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M14.625 15.167C16.558 15.167 18.125 13.6 18.125 11.667C18.125 9.734 16.558 8.16699 14.625 8.16699C12.692 8.16699 11.125 9.734 11.125 11.667C11.125 13.6 12.692 15.167 14.625 15.167Z" stroke="#00A63E" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '25+',
                                valueColor: const Color(0xFF00A63E),
                                label: 'Hot Locations',
                              ),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="29" viewBox="0 0 29 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M14.125 2.58301V25.9163" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M19.9583 6.08301H11.2083C10.1254 6.08301 9.08675 6.51322 8.32098 7.27899C7.55521 8.04476 7.125 9.08337 7.125 10.1663C7.125 11.2493 7.55521 12.2879 8.32098 13.0537C9.08675 13.8195 10.1254 14.2497 11.2083 14.2497H17.0417C18.1246 14.2497 19.1632 14.6799 19.929 15.4457C20.6948 16.2114 21.125 17.25 21.125 18.333C21.125 19.416 20.6948 20.4546 19.929 21.2204C19.1632 21.9861 18.1246 22.4163 17.0417 22.4163H7.125" stroke="#9810FA" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '₹8.5L',
                                valueColor: const Color(0xFF9810FA),
                                label: 'Avg. Price/sqft',
                              ),
                              MarketHighlightCard(
                                icon: SvgPicture.string(
                                  '''<svg width="29" height="29" viewBox="0 0 29 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M19.2916 24.75V22.4167C19.2916 21.179 18.7999 19.992 17.9248 19.1168C17.0496 18.2417 15.8626 17.75 14.6249 17.75H7.62492C6.38724 17.75 5.20026 18.2417 4.32509 19.1168C3.44992 19.992 2.95825 21.179 2.95825 22.4167V24.75" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M19.2917 3.89941C20.2925 4.15885 21.1787 4.74322 21.8114 5.56082C22.444 6.37842 22.7873 7.38295 22.7873 8.41675C22.7873 9.45054 22.444 10.4551 21.8114 11.2727C21.1787 12.0903 20.2925 12.6746 19.2917 12.9341" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M26.2917 24.7497V22.4164C26.291 21.3824 25.9468 20.3779 25.3133 19.5607C24.6799 18.7435 23.7929 18.1599 22.7917 17.9014" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11.1249 13.0833C13.7022 13.0833 15.7916 10.994 15.7916 8.41667C15.7916 5.83934 13.7022 3.75 11.1249 3.75C8.54759 3.75 6.45825 5.83934 6.45825 8.41667C6.45825 10.994 8.54759 13.0833 11.1249 13.0833Z" stroke="#F54900" stroke-width="2.33333" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 28,
                                  height: 28,
                                ),
                                value: '2.3K',
                                valueColor: const Color(0xFFF54900),
                                label: 'New Investors',
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
