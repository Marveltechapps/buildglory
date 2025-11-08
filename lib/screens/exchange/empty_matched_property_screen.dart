import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyMatchedPropertyScreen extends StatelessWidget {
  const EmptyMatchedPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          title: Text(
            'Matched Properties',
            style: TextStyle(
              fontFamily: 'Arial, -apple-system, Roboto, Helvetica, sans-serif',
              fontSize: 18,
              color: const Color(0xFF1A1A1A),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.35,
              height: 1.4,
            ),
          ),
          subtitle: Text(
            '0 properties match your exchange',
            style: TextStyle(
              fontFamily: 'Arial, -apple-system, Roboto, Helvetica, sans-serif',
              fontSize: 12,
              color: const Color(0xFF6A7282),
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        //  constraints: const BoxConstraints(maxWidth: 377),
        child: Column(
          children: [
            // Content Container
            Container(
              //  constraints: const BoxConstraints(minHeight: 604),
              padding: const EdgeInsets.fromLTRB(16, 213, 16, 213),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      color: const Color(0xFFF3F4F6),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        filterblackIcon,
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Matching Properties',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:
                              'Arial, -apple-system, Roboto, Helvetica, sans-serif',
                          fontSize: 16,
                          color: const Color(0xFF102840),
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.16,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 334),
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Explore additional listings in the buying section.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily:
                                  'Arial, -apple-system, Roboto, Helvetica, sans-serif',
                              fontSize: 12,
                              color: const Color(0xFF6A7282),
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeMainScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF030213),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Browse More Properties',
                            style: TextStyle(
                              fontFamily:
                                  'Arial, -apple-system, Roboto, Helvetica, sans-serif',
                              fontSize: 14,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
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
