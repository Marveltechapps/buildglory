import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.35,
            fontFamily: 'Arial',
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Main Content Area
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 639),
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 456),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 20, 12, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Empty State Icon
                            SvgPicture.asset(
                              searchgreyIcon,
                              width: 56,
                              height: 56,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 14),
                            // Heading
                            SizedBox(
                              width: double.infinity,
                              child: const Text(
                                'No Favourites Yet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF102840),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  height: 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            // Description
                            Container(
                              constraints: const BoxConstraints(maxWidth: 320),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: const Text(
                                'Start exploring properties and save your favorites here.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF4A5565),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
