import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_button.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String badge;
  final Color badgeColor;
  final Color badgeBackgroundColor;
  final String title;
  final String description;
  final String date;
  final String readTime;
  final bool isMobile;

  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.badge,
    required this.badgeColor,
    required this.badgeBackgroundColor,
    required this.title,
    required this.description,
    required this.date,
    required this.readTime,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                Container(
                  width: double.infinity,
                  height: 120,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.75),
                          topRight: Radius.circular(12.75),
                        ),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3.5),
                          decoration: BoxDecoration(
                            color: badgeBackgroundColor,
                            borderRadius: BorderRadius.circular(6.75),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              color: badgeColor,
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
                // Content
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF0A0A0A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 15 / 12,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Color(0xFF4A5565),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 14 / 11,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  date,
                                  style: const TextStyle(
                                    color: Color(0xFF6A7282),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    height: 14 / 11,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  readTime,
                                  style: const TextStyle(
                                    color: Color(0xFF6A7282),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    height: 14 / 11,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: 'Report',
                                  backgroundColor: Colors.white,
                                  textColor: const Color(0xFF155DFC),
                                  borderColor: const Color(0xFF155DFC),
                                  fontSize: 11,
                                  height: 32,
                                  icon: SvgPicture.string(
                                    '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                      <g clip-path="url(#clip0_3190_1844)">
                                        <path d="M8.99992 1.29199H3.74992C3.4405 1.29199 3.14375 1.41491 2.92496 1.6337C2.70617 1.85249 2.58325 2.14924 2.58325 2.45866V11.792C2.58325 12.1014 2.70617 12.3982 2.92496 12.617C3.14375 12.8357 3.4405 12.9587 3.74992 12.9587H10.7499C11.0593 12.9587 11.3561 12.8357 11.5749 12.617C11.7937 12.3982 11.9166 12.1014 11.9166 11.792V4.20866L8.99992 1.29199Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M8.41675 1.29199V3.62533C8.41675 3.93474 8.53966 4.23149 8.75846 4.45028C8.97725 4.66908 9.274 4.79199 9.58341 4.79199H11.9167" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M6.08341 5.375H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M9.58341 7.70801H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M9.58341 10.042H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                      </g>
                                      <defs>
                                        <clipPath id="clip0_3190_1844">
                                          <rect width="14" height="14" fill="white" transform="translate(0.25 0.125)"/>
                                        </clipPath>
                                      </defs>
                                    </svg>''',
                                    width: 14,
                                    height: 14,
                                    color: const Color(0xFF155DFC),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.75),
                                ),
                                child: Center(
                                  child: SvgPicture.string(
                                    '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                      <g clip-path="url(#clip0_3190_1852)">
                                        <path d="M1.45297 7.32797C1.40435 7.197 1.40435 7.05293 1.45297 6.92197C1.92646 5.77388 2.73018 4.79224 3.76225 4.10149C4.79431 3.41074 6.00824 3.04199 7.25013 3.04199C8.49202 3.04199 9.70595 3.41074 10.738 4.10149C11.7701 4.79224 12.5738 5.77388 13.0473 6.92197C13.0959 7.05293 13.0959 7.197 13.0473 7.32797C12.5738 8.47605 11.7701 9.45769 10.738 10.1484C9.70595 10.8392 8.49202 11.2079 7.25013 11.2079C6.00824 11.2079 4.79431 10.8392 3.76225 10.1484C2.73018 9.45769 1.92646 8.47605 1.45297 7.32797Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M7.25 8.875C8.2165 8.875 9 8.0915 9 7.125C9 6.1585 8.2165 5.375 7.25 5.375C6.2835 5.375 5.5 6.1585 5.5 7.125C5.5 8.0915 6.2835 8.875 7.25 8.875Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                      </g>
                                      <defs>
                                        <clipPath id="clip0_3190_1852">
                                          <rect width="14" height="14" fill="white" transform="translate(0.25 0.125)"/>
                                        </clipPath>
                                      </defs>
                                    </svg>''',
                                    width: 14,
                                    height: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                Container(
                  width: 84,
                  height: 132,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.75),
                          bottomLeft: Radius.circular(8.75),
                        ),
                        child: Image.network(
                          imageUrl,
                          width: 84,
                          height: 151,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3.5),
                          decoration: BoxDecoration(
                            color: badgeBackgroundColor,
                            borderRadius: BorderRadius.circular(6.75),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              color: badgeColor,
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

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 15 / 12,
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color(0xFF4A5565),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            height: 14 / 11,
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      date,
                                      style: const TextStyle(
                                        color: Color(0xFF6A7282),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        height: 14 / 11,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      readTime,
                                      style: const TextStyle(
                                        color: Color(0xFF6A7282),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        height: 14 / 11,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                CustomButton(
                                  text: 'Report',
                                  backgroundColor: Colors.white,
                                  textColor: const Color(0xFF155DFC),
                                  borderColor: const Color(0xFF155DFC),
                                  fontSize: 11,
                                  height: 24.5,
                                  icon: SvgPicture.string(
                                    '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                      <g clip-path="url(#clip0_3190_1844)">
                                        <path d="M8.99992 1.29199H3.74992C3.4405 1.29199 3.14375 1.41491 2.92496 1.6337C2.70617 1.85249 2.58325 2.14924 2.58325 2.45866V11.792C2.58325 12.1014 2.70617 12.3982 2.92496 12.617C3.14375 12.8357 3.4405 12.9587 3.74992 12.9587H10.7499C11.0593 12.9587 11.3561 12.8357 11.5749 12.617C11.7937 12.3982 11.9166 12.1014 11.9166 11.792V4.20866L8.99992 1.29199Z" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M8.41675 1.29199V3.62533C8.41675 3.93474 8.53966 4.23149 8.75846 4.45028C8.97725 4.66908 9.274 4.79199 9.58341 4.79199H11.9167" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M6.08341 5.375H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M9.58341 7.70801H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M9.58341 10.042H4.91675" stroke="#155DFC" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                      </g>
                                      <defs>
                                        <clipPath id="clip0_3190_1844">
                                          <rect width="14" height="14" fill="white" transform="translate(0.25 0.125)"/>
                                        </clipPath>
                                      </defs>
                                    </svg>''',
                                    width: 14,
                                    height: 14,
                                    color: const Color(0xFF155DFC),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 31.5,
                                  height: 24.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.75),
                                  ),
                                  child: Center(
                                    child: SvgPicture.string(
                                      '''<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_3190_1852)">
                                          <path d="M1.45297 7.32797C1.40435 7.197 1.40435 7.05293 1.45297 6.92197C1.92646 5.77388 2.73018 4.79224 3.76225 4.10149C4.79431 3.41074 6.00824 3.04199 7.25013 3.04199C8.49202 3.04199 9.70595 3.41074 10.738 4.10149C11.7701 4.79224 12.5738 5.77388 13.0473 6.92197C13.0959 7.05293 13.0959 7.197 13.0473 7.32797C12.5738 8.47605 11.7701 9.45769 10.738 10.1484C9.70595 10.8392 8.49202 11.2079 7.25013 11.2079C6.00824 11.2079 4.79431 10.8392 3.76225 10.1484C2.73018 9.45769 1.92646 8.47605 1.45297 7.32797Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                          <path d="M7.25 8.875C8.2165 8.875 9 8.0915 9 7.125C9 6.1585 8.2165 5.375 7.25 5.375C6.2835 5.375 5.5 6.1585 5.5 7.125C5.5 8.0915 6.2835 8.875 7.25 8.875Z" stroke="#4A5565" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                                        </g>
                                        <defs>
                                          <clipPath id="clip0_3190_1852">
                                            <rect width="14" height="14" fill="white" transform="translate(0.25 0.125)"/>
                                          </clipPath>
                                        </defs>
                                      </svg>''',
                                      width: 14,
                                      height: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
