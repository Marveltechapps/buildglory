import 'package:flutter/material.dart';
import 'stat_item.dart';

class MarketSnapshotCard extends StatelessWidget {
  const MarketSnapshotCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640 && screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isTablet ? 8 : (isMobile ? 8 : 16),
        vertical: isMobile ? 12 : 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: const Color(0xFFBEDBFF), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFEFF6FF), Color(0xFFEEF2FF)],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Container(
              padding: const EdgeInsets.only(right: 150, bottom: 2.5),
              child: const Text(
                'OMR Market Snapshot',
                style: TextStyle(
                  color: Color(0xFF1C398E),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 24.5 / 16,
                  fontFamily: 'Arial',
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Stats Grid
            Container(
              height: isMobile ? null : 225,
              constraints: BoxConstraints(
                minHeight: isTablet ? 200 : (isMobile ? 180 : 225),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: isMobile ? 12 : 16,
                mainAxisSpacing: isMobile ? 12 : 16,
                children: const [
                  StatItem(
                    iconSvg: '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M5.5 19.25V3.5C5.5 3.03587 5.68437 2.59075 6.01256 2.26256C6.34075 1.93437 6.78587 1.75 7.25 1.75H14.25C14.7141 1.75 15.1592 1.93437 15.4874 2.26256C15.8156 2.59075 16 3.03587 16 3.5V19.25H5.5Z" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M5.5 10.5H3.75C3.28587 10.5 2.84075 10.6844 2.51256 11.0126C2.18437 11.3408 2 11.7859 2 12.25V17.5C2 17.9641 2.18437 18.4092 2.51256 18.7374C2.84075 19.0656 3.28587 19.25 3.75 19.25H5.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M16 7.875H17.75C18.2141 7.875 18.6592 8.05937 18.9874 8.38756C19.3156 8.71575 19.5 9.16087 19.5 9.625V17.5C19.5 17.9641 19.3156 18.4092 18.9874 18.7374C18.6592 19.0656 18.2141 19.25 17.75 19.25H16" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9 5.25H12.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9 8.75H12.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9 12.25H12.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9 15.75H12.5" stroke="#155DFC" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>''',
                    value: '₹6K-12K',
                    label: 'Price per sqft',
                  ),
                  StatItem(
                    iconSvg: '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M14.75 6.125H20V11.375" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M20 6.125L12.5625 13.5625L8.1875 9.1875L2.5 14.875" stroke="#00A63E" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>''',
                    value: '8-12%',
                    label: 'Annual Growth',
                  ),
                  StatItem(
                    iconSvg: '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M17.75 9.25C17.75 13.6189 12.9034 18.1689 11.2759 19.5741C11.1243 19.6881 10.9397 19.7498 10.75 19.7498C10.5603 19.7498 10.3757 19.6881 10.2241 19.5741C8.59663 18.1689 3.75 13.6189 3.75 9.25C3.75 7.39348 4.4875 5.61301 5.80025 4.30025C7.11301 2.9875 8.89348 2.25 10.75 2.25C12.6065 2.25 14.387 2.9875 15.6997 4.30025C17.0125 5.61301 17.75 7.39348 17.75 9.25Z" stroke="#9810FA" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M10.75 11.875C12.1997 11.875 13.375 10.6997 13.375 9.25C13.375 7.80025 12.1997 6.625 10.75 6.625C9.30025 6.625 8.125 7.80025 8.125 9.25C8.125 10.6997 9.30025 11.875 10.75 11.875Z" stroke="#9810FA" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>''',
                    value: '25+',
                    label: 'IT Companies',
                  ),
                  StatItem(
                    iconSvg: '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M14.75 18.875V17.125C14.75 16.1967 14.3813 15.3065 13.7249 14.6501C13.0685 13.9937 12.1783 13.625 11.25 13.625H6C5.07174 13.625 4.1815 13.9937 3.52513 14.6501C2.86875 15.3065 2.5 16.1967 2.5 17.125V18.875" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M14.75 3.2373C15.5005 3.43188 16.1652 3.87016 16.6397 4.48336C17.1142 5.09656 17.3717 5.84996 17.3717 6.6253C17.3717 7.40065 17.1142 8.15405 16.6397 8.76725C16.1652 9.38045 15.5005 9.81873 14.75 10.0133" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M20 18.8745V17.1245C19.9994 16.349 19.7413 15.5957 19.2662 14.9828C18.7911 14.3699 18.1259 13.9322 17.375 13.7383" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M8.625 10.125C10.558 10.125 12.125 8.558 12.125 6.625C12.125 4.692 10.558 3.125 8.625 3.125C6.692 3.125 5.125 4.692 5.125 6.625C5.125 8.558 6.692 10.125 8.625 10.125Z" stroke="#F54900" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>''',
                    value: '3-4%',
                    label: 'Rental Yield',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
