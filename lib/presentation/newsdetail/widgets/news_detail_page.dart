import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'market_snapshot_card.dart';
import 'related_article_card.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640 && screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Container(
          width: isMobile ? double.infinity : (isTablet ? 768 : 377),
          constraints: BoxConstraints(
            maxWidth: isTablet ? 768 : double.infinity,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                  ),
                ),
                child: Container(
                  height: 35,
                  child: Row(
                    children: [
                      // Back Button
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: SvgPicture.string(
                            '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M7.50008 11.5837L3.41675 7.50033L7.50008 3.41699" stroke="#0A0A0A" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                              <path d="M11.5834 7.5H3.41675" stroke="#0A0A0A" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>''',
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Title
                      Expanded(
                        child: Container(
                          height: 24.5,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Real Estate News',
                            style: TextStyle(
                              color: Color(0xFF0A0A0A),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 24.5 / 18,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form Container
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Image Section
                    Container(
                      height: isMobile ? 180 : (isTablet ? 200 : 224),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          // Main Image
                          Positioned.fill(
                            child: Image.network(
                              'https://api.builder.io/api/v1/image/assets/TEMP/0f99dfe30d2fc55622f21dcc172aa8229ae498c4?width=754',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported),
                                );
                              },
                            ),
                          ),
                          // Badge
                          Positioned(
                            left: 14,
                            top: 17,
                            child: Container(
                              width: 48,
                              height: 18,
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.75),
                              ),
                              child: const Center(
                                child: Text(
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
                          ),
                          // Share Button
                          Positioned(
                            right: 14,
                            top: 14,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.string(
                                  '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11 5.16699C11.9665 5.16699 12.75 4.38349 12.75 3.41699C12.75 2.45049 11.9665 1.66699 11 1.66699C10.0335 1.66699 9.25 2.45049 9.25 3.41699C9.25 4.38349 10.0335 5.16699 11 5.16699Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M4 9.25C4.9665 9.25 5.75 8.4665 5.75 7.5C5.75 6.5335 4.9665 5.75 4 5.75C3.0335 5.75 2.25 6.5335 2.25 7.5C2.25 8.4665 3.0335 9.25 4 9.25Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M11 13.333C11.9665 13.333 12.75 12.5495 12.75 11.583C12.75 10.6165 11.9665 9.83301 11 9.83301C10.0335 9.83301 9.25 10.6165 9.25 11.583C9.25 12.5495 10.0335 13.333 11 13.333Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M5.51074 8.38086L9.49491 10.7025" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M9.48908 4.29785L5.51074 6.61952" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>''',
                                  width: 14,
                                  height: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Footer Container
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Article Title and Meta
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Property Prices Rise 8% in Chennai',
                                  style: TextStyle(
                                    color: const Color(0xFF0A0A0A),
                                    fontSize: isMobile ? 18 : 21,
                                    fontWeight: FontWeight.w400,
                                    height: isMobile ? 22 / 18 : 26 / 21,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Meta Information
                              Container(
                                height: isMobile ? null : 17.5,
                                child: Wrap(
                                  spacing: 14,
                                  runSpacing: isMobile ? 8 : 0,
                                  children: [
                                    // Date
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.string(
                                          '''<svg width="14" height="15" viewBox="0 0 14 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_3190_2244)">
                                              <path d="M4.66675 1.91699V4.25033" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M9.33325 1.91699V4.25033" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M11.0833 3.08301H2.91667C2.27233 3.08301 1.75 3.60534 1.75 4.24967V12.4163C1.75 13.0607 2.27233 13.583 2.91667 13.583H11.0833C11.7277 13.583 12.25 13.0607 12.25 12.4163V4.24967C12.25 3.60534 11.7277 3.08301 11.0833 3.08301Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M1.75 6.58301H12.25" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_3190_2244">
                                                <rect width="14" height="14" fill="white" transform="translate(0 0.75)"/>
                                              </clipPath>
                                            </defs>
                                          </svg>''',
                                          width: 14,
                                          height: 14,
                                        ),
                                        const SizedBox(width: 3.5),
                                        const Text(
                                          '2 hours ago',
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

                                    // Read Time
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.string(
                                          '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_3190_2252)">
                                              <path d="M7.95312 4.25V7.75L10.2865 8.91667" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M7.95321 13.5837C11.1749 13.5837 13.7865 10.972 13.7865 7.75033C13.7865 4.52866 11.1749 1.91699 7.95321 1.91699C4.73155 1.91699 2.11987 4.52866 2.11987 7.75033C2.11987 10.972 4.73155 13.5837 7.95321 13.5837Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_3190_2252">
                                                <rect width="14" height="14" fill="white" transform="translate(0.953125 0.75)"/>
                                              </clipPath>
                                            </defs>
                                          </svg>''',
                                          width: 14,
                                          height: 14,
                                        ),
                                        const SizedBox(width: 3.5),
                                        const Text(
                                          '5 min read',
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

                                    // Views
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.string(
                                          '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_3190_2258)">
                                              <path d="M1.54672 7.95297C1.4981 7.822 1.4981 7.67793 1.54672 7.54697C2.02021 6.39888 2.82393 5.41724 3.856 4.72649C4.88806 4.03574 6.10199 3.66699 7.34388 3.66699C8.58577 3.66699 9.7997 4.03574 10.8318 4.72649C11.8638 5.41724 12.6676 6.39888 13.141 7.54697C13.1897 7.67793 13.1897 7.822 13.141 7.95297C12.6676 9.10105 11.8638 10.0827 10.8318 10.7734C9.7997 11.4642 8.58577 11.8329 7.34388 11.8329C6.10199 11.8329 4.88806 11.4642 3.856 10.7734C2.82393 10.0827 2.02021 9.10105 1.54672 7.95297Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                              <path d="M7.34375 9.5C8.31025 9.5 9.09375 8.7165 9.09375 7.75C9.09375 6.7835 8.31025 6 7.34375 6C6.37725 6 5.59375 6.7835 5.59375 7.75C5.59375 8.7165 6.37725 9.5 7.34375 9.5Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_3190_2258">
                                                <rect width="14" height="14" fill="white" transform="translate(0.34375 0.75)"/>
                                              </clipPath>
                                            </defs>
                                          </svg>''',
                                          width: 14,
                                          height: 14,
                                        ),
                                        const SizedBox(width: 3.5),
                                        const Text(
                                          '2.4k views',
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
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Action Buttons
                              Container(
                                height: isMobile ? null : 31.5,
                                child: isMobile
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          _buildViewReportButton(),
                                          const SizedBox(height: 8),
                                          _buildDownloadButton(),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(child: _buildViewReportButton()),
                                          const SizedBox(width: 10.5),
                                          _buildDownloadButton(),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Article Content
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text(
                              '''The Mahabalipuram road (OMR), Chennai has witnessed one of the biggest IT Corridor hotspots and is home to many IT/ITES companies such as TCS, Infosys, Wipro, Cognizant, HCL and others. The OMR corridor has emerged as a major residential destination due to its proximity to IT companies, excellent connectivity, and modern infrastructure. With the expansion of the metro line and development of new IT parks, property values have seen consistent growth.

Key Development Highlights:
• Major IT companies establishing offices along the corridor
• Metro connectivity enhancing transportation
• Modern residential complexes with world-class amenities
• Educational institutions and healthcare facilities
• Shopping malls and entertainment centers

Investment Opportunities:
The OMR corridor presents excellent investment opportunities for both end-users and investors. With rental yields averaging 3-4% and capital appreciation of 8-12% annually, it remains one of Chennai's most promising real estate markets.

Market Analysis:
Current property prices range from ₹6,000 to ₹12,000 per square foot depending on the specific location and amenities. Premium projects near major IT parks command higher prices due to proximity and convenience.

Future Prospects:
With continued infrastructure development and IT sector growth, the OMR corridor is expected to maintain its growth trajectory, making it an attractive destination for real estate investment.''',
                              style: TextStyle(
                                color: Color(0xFF364153),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 23 / 14,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Market Snapshot Card
                          const MarketSnapshotCard(),
                          const SizedBox(height: 20),

                          // Related Articles Section
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Related Articles',
                                  style: TextStyle(
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 24.5 / 16,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Column(
                                  children: [
                                    RelatedArticleCard(
                                      title: 'Investment Guide: Chennai IT Corridor',
                                      description: 'Complete investment analysis for IT corridor properties',
                                      date: 'March 10, 2024',
                                      imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/f36e79f37185cccdedd59b4d9d31a095e92a367f?width=112',
                                    ),
                                    const SizedBox(height: 10.5),
                                    RelatedArticleCard(
                                      title: 'Investment Guide: Chennai IT Corridor',
                                      description: 'Complete investment analysis for IT corridor properties',
                                      date: 'March 10, 2024',
                                      imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/f36e79f37185cccdedd59b4d9d31a095e92a367f?width=112',
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewReportButton() {
    return Container(
      height: 31.5,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF155DFC),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 8.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.75),
          ),
          elevation: 0,
        ),
        icon: SvgPicture.string(
          '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g clip-path="url(#clip0_3190_2265)">
              <path d="M9.14054 1.41699H3.89054C3.58112 1.41699 3.28438 1.53991 3.06559 1.7587C2.84679 1.97749 2.72388 2.27424 2.72388 2.58366V11.917C2.72388 12.2264 2.84679 12.5232 3.06559 12.742C3.28438 12.9607 3.58112 13.0837 3.89054 13.0837H10.8905C11.2 13.0837 11.4967 12.9607 11.7155 12.742C11.9343 12.5232 12.0572 12.2264 12.0572 11.917V4.33366L9.14054 1.41699Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M8.55737 1.41699V3.75033C8.55737 4.05974 8.68029 4.35649 8.89908 4.57528C9.11787 4.79408 9.41462 4.91699 9.72404 4.91699H12.0574" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M6.22404 5.5H5.05737" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M9.72404 7.83301H5.05737" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M9.72404 10.167H5.05737" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
            </g>
            <defs>
              <clipPath id="clip0_3190_2265">
                <rect width="14" height="14" fill="white" transform="translate(0.390625 0.25)"/>
              </clipPath>
            </defs>
          </svg>''',
          width: 14,
          height: 14,
        ),
        label: const Text(
          'View Report',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 17.5 / 12,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadButton() {
    return Container(
      height: 31.5,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF155DFC),
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 8.5),
          side: const BorderSide(color: Color(0xFF155DFC), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.75),
          ),
        ),
        icon: SvgPicture.string(
          '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M7.82812 9V2" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M13.0781 9V11.3333C13.0781 11.6428 12.9552 11.9395 12.7364 12.1583C12.5176 12.3771 12.2209 12.5 11.9115 12.5H3.74479C3.43537 12.5 3.13863 12.3771 2.91983 12.1583C2.70104 11.9395 2.57813 11.6428 2.57812 11.3333V9" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M4.91138 6.08301L7.82804 8.99967L10.7447 6.08301" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>''',
          width: 14,
          height: 14,
        ),
        label: const Text(
          'Download',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 17.5 / 12,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
