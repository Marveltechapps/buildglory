import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CTASection extends StatelessWidget {
  const CTASection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 991 ? 16 : 16,
        vertical: MediaQuery.of(context).size.width > 991 ? 16 : 20,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF155DFC),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width <= 640 ? 20 : 80.5,
                  vertical: MediaQuery.of(context).size.width <= 640 ? 12 : 10.25,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.75),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.string(
                    '''<svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M8.75004 1.16699H3.50004C3.19062 1.16699 2.89388 1.28991 2.67508 1.5087C2.45629 1.72749 2.33337 2.02424 2.33337 2.33366V11.667C2.33337 11.9764 2.45629 12.2732 2.67508 12.492C2.89388 12.7107 3.19062 12.8337 3.50004 12.8337H10.5C10.8095 12.8337 11.1062 12.7107 11.325 12.492C11.5438 12.2732 11.6667 11.9764 11.6667 11.667V4.08366L8.75004 1.16699Z" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M8.16663 1.16699V3.50033C8.16663 3.80974 8.28954 4.10649 8.50833 4.32528C8.72713 4.54408 9.02387 4.66699 9.33329 4.66699H11.6666" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M5.83329 5.25H4.66663" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9.33329 7.58301H4.66663" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M9.33329 9.91699H4.66663" stroke="white" stroke-width="1.16667" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>''',
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'Start Property Submission',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 17.5/12,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Takes only 10-15 minutes to complete',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF6A7282),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 14/11,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }
}
