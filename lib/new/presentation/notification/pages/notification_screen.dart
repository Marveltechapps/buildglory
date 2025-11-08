import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text("Notification"),
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        width: double.infinity,
        child: Column(
          children: [
            // Content Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0x1A000000), width: 1),
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 13, 16),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 319),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Notification Icon
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: SvgPicture.asset(
                          apartmentblueIcon,
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row with Title and Timestamp
                            Container(
                              constraints: const BoxConstraints(minHeight: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title
                                  Expanded(
                                    child: SizedBox(
                                      height: 18,
                                      child: const Text(
                                        'Enquiry Updates',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF101828),
                                          height: 1,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  // Timestamp
                                  Container(
                                    //width: 101,
                                    constraints: const BoxConstraints(
                                      minHeight: 14,
                                    ),
                                    child: const Text(
                                      '29/06/2025 @2:27pm',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF6A7282),
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Description
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: const Text(
                                'Agent John has responded to your enquiry for the 2BHK Villa in Sholinganallur.',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4A5565),
                                  height: 20 / 12,
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
          ],
        ),
      ),
    );
  }
}
