import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CtaCard extends StatelessWidget {
  final String iconSvg;
  final Color backgroundColor;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonTextColor;

  const CtaCard({
    Key? key,
    required this.iconSvg,
    required this.backgroundColor,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //  constraints: const BoxConstraints(maxWidth: 334),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: Border.all(color: const Color(0x1A000000)),
      ),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 332),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Content row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon container
                Container(
                  width: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0x33FFFFFF),
                  ),
                  child: Center(
                    child: SvgPicture.string(
                      iconSvg,
                      width: 21,
                      height: 21,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Description
                      Text(
                        description,
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDCFCE7),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFFFFFFF),
              ),
              padding: const EdgeInsets.fromLTRB(11, 3, 11, 3),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: buttonTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
