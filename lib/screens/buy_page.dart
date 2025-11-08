import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/tab_navigation.dart';
import '../widgets/hero_card.dart';
import '../widgets/features_section.dart';
import '../widgets/process_steps.dart';
import '../widgets/category_grid.dart';
import '../widgets/offers_card.dart';
import '../widgets/bottom_navigation.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderSection(),
                    const SizedBox(height: 20),
                    const TabNavigation(),
                    const SizedBox(height: 14),
                    Container(
                      color: Colors.white,
                      child: const Column(
                        children: [
                          SizedBox(height: 14),
                          HeroCard(),
                          SizedBox(height: 18),
                          FeaturesSection(),
                          SizedBox(height: 28),
                          ProcessSteps(),
                          SizedBox(height: 20),
                          CategoryGrid(),
                          SizedBox(height: 20),
                          OffersCard(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BottomNavigationSection(),
          ],
        ),
      ),
    );
  }
}
